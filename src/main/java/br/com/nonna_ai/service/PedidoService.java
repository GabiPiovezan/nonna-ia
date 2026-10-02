package br.com.nonna_ai.service;
import br.com.nonna_ai.dto.PedidoRequestDTO;
import br.com.nonna_ai.dto.PedidoResumoDTO;
import br.com.nonna_ai.dto.PedidoDetalheDTO;
import br.com.nonna_ai.entity.Pedido;
import br.com.nonna_ai.entity.ProdutoPedido;
import br.com.nonna_ai.exception.BusinessException;
import br.com.nonna_ai.repository.PedidoRepository;
import br.com.nonna_ai.repository.ProdutoPedidoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class PedidoService {
    private final PedidoRepository repository;
    private final ProdutoPedidoRepository itemRepository;

    public PedidoService(PedidoRepository repository, ProdutoPedidoRepository itemRepository) {
        this.repository = repository;
        this.itemRepository = itemRepository;
    }

    @Transactional
    public PedidoResumoDTO create(PedidoRequestDTO dto) {
        Pedido p = new Pedido();
        p.setId(UUID.randomUUID().toString());
        p.setIdCliente(dto.idCliente());
        p.setTipoEntrega(dto.tipoEntrega());
        p.setEndereco(dto.endereco());
        p.setFormaPagamento(dto.formaPagamento());
        p.setTelefone(dto.telefone());
        p.setHorarioCriacao(LocalDateTime.now());
        p.setStatus("CRIADO");

        double total = dto.itens().stream().mapToDouble(PedidoRequestDTO.ItemPedidoDTO::preco).sum();
        p.setPrecoTotal(total);
        repository.save(p);

        for (var itemDTO : dto.itens()) {
            ProdutoPedido item = new ProdutoPedido();
            item.setId(UUID.randomUUID().toString());
            item.setIdPedido(p.getId());
            item.setIdProduto(itemDTO.idProduto());
            item.setPreco(itemDTO.preco());
            itemRepository.save(item);
        }

        return new PedidoResumoDTO(p.getId(), p.getIdCliente(), p.getPrecoTotal(), p.getStatus(), p.getHorarioCriacao().toString());
    }

    public List<PedidoResumoDTO> findNaoConcluidos(int page, int size) {
        return repository.findNaoConcluidos(size, page * size).stream()
            .map(p -> new PedidoResumoDTO(p.getId(), p.getIdCliente(), p.getPrecoTotal(), p.getStatus(), p.getHorarioCriacao().toString()))
            .collect(Collectors.toList());
    }

    public PedidoDetalheDTO findById(String id) {
        Pedido p = repository.findById(id);
        if (p == null) throw new BusinessException("PEDIDO NÃƒO ENCONTRADO");
        List<ProdutoPedido> itens = itemRepository.findByPedidoId(id);
        
        List<PedidoDetalheDTO.ItemPedidoDTO> itensDTO = itens.stream()
            .map(i -> new PedidoDetalheDTO.ItemPedidoDTO(i.getIdProduto(), i.getPreco()))
            .collect(Collectors.toList());

        return new PedidoDetalheDTO(p.getId(), p.getIdCliente(), p.getPrecoTotal(), p.getTipoEntrega(), p.getEndereco(),
            p.getFormaPagamento(), p.getTelefone(), p.getStatus(), 
            p.getHorarioCriacao() != null ? p.getHorarioCriacao().toString() : null,
            p.getHorarioSaida() != null ? p.getHorarioSaida().toString() : null,
            p.getHorarioFinalizacao() != null ? p.getHorarioFinalizacao().toString() : null,
            p.getMotivoCancelamento(), itensDTO);
    }

    public PedidoResumoDTO updateStatus(String id, String novoStatus) {
        Pedido p = repository.findById(id);
        if (p == null) throw new BusinessException("PEDIDO NÃƒO ENCONTRADO");
        p.setStatus(novoStatus);
        if ("SAIU_PARA_ENTREGA".equals(novoStatus)) p.setHorarioSaida(LocalDateTime.now());
        if ("CONCLUIDO".equals(novoStatus)) p.setHorarioFinalizacao(LocalDateTime.now());
        repository.update(p);
        return new PedidoResumoDTO(p.getId(), p.getIdCliente(), p.getPrecoTotal(), p.getStatus(), p.getHorarioCriacao().toString());
    }

    public PedidoResumoDTO cancelar(String id, String motivo) {
        Pedido p = repository.findById(id);
        if (p == null) throw new BusinessException("PEDIDO NÃƒO ENCONTRADO");
        p.setStatus("CANCELADO");
        p.setHorarioFinalizacao(LocalDateTime.now());
        p.setMotivoCancelamento(motivo);
        repository.update(p);
        return new PedidoResumoDTO(p.getId(), p.getIdCliente(), p.getPrecoTotal(), p.getStatus(), p.getHorarioCriacao().toString());
    }
}
