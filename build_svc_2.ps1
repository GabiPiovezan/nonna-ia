$files = @{
"src\main\java\br\com\nonna_ai\service\PedidoService.java" = @"
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
        if (p == null) throw new BusinessException("PEDIDO NÃO ENCONTRADO");
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
        if (p == null) throw new BusinessException("PEDIDO NÃO ENCONTRADO");
        p.setStatus(novoStatus);
        if ("SAIU_PARA_ENTREGA".equals(novoStatus)) p.setHorarioSaida(LocalDateTime.now());
        if ("CONCLUIDO".equals(novoStatus)) p.setHorarioFinalizacao(LocalDateTime.now());
        repository.update(p);
        return new PedidoResumoDTO(p.getId(), p.getIdCliente(), p.getPrecoTotal(), p.getStatus(), p.getHorarioCriacao().toString());
    }

    public PedidoResumoDTO cancelar(String id, String motivo) {
        Pedido p = repository.findById(id);
        if (p == null) throw new BusinessException("PEDIDO NÃO ENCONTRADO");
        p.setStatus("CANCELADO");
        p.setHorarioFinalizacao(LocalDateTime.now());
        p.setMotivoCancelamento(motivo);
        repository.update(p);
        return new PedidoResumoDTO(p.getId(), p.getIdCliente(), p.getPrecoTotal(), p.getStatus(), p.getHorarioCriacao().toString());
    }
}
"@;

"src\main\java\br\com\nonna_ai\controller\PedidoController.java" = @"
package br.com.nonna_ai.controller;
import br.com.nonna_ai.dto.PedidoRequestDTO;
import br.com.nonna_ai.dto.PedidoResumoDTO;
import br.com.nonna_ai.dto.PedidoDetalheDTO;
import br.com.nonna_ai.service.PedidoService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/pedidos")
public class PedidoController {
    private final PedidoService service;
    public PedidoController(PedidoService service) { this.service = service; }

    @PostMapping
    public PedidoResumoDTO create(@Valid @RequestBody PedidoRequestDTO dto) { return service.create(dto); }

    @GetMapping
    public List<PedidoResumoDTO> findNaoConcluidos(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "30") int size) {
        if(size > 100) size = 100;
        return service.findNaoConcluidos(page, size);
    }

    @GetMapping("/{id}")
    public PedidoDetalheDTO findById(@PathVariable String id) { return service.findById(id); }

    @PutMapping("/{id}")
    public PedidoResumoDTO updateStatus(@PathVariable String id, @RequestBody Map<String, String> body) {
        return service.updateStatus(id, body.get("status"));
    }

    @PostMapping("/{id}/cancelar")
    public PedidoResumoDTO cancelar(@PathVariable String id, @RequestBody Map<String, String> body) {
        return service.cancelar(id, body.get("motivo"));
    }
}
"@;

"src\main\java\br\com\nonna_ai\service\ClienteService.java" = @"
package br.com.nonna_ai.service;
import br.com.nonna_ai.dto.ClienteResponseDTO;
import br.com.nonna_ai.entity.Cliente;
import br.com.nonna_ai.exception.BusinessException;
import br.com.nonna_ai.repository.ClienteRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ClienteService {
    private final ClienteRepository repository;
    public ClienteService(ClienteRepository repository) { this.repository = repository; }

    public List<ClienteResponseDTO> findAll(int page, int size) {
        return repository.findAll(size, page * size).stream()
            .map(c -> new ClienteResponseDTO(c.getId(), c.getNome(), c.getSobrenome(), c.getEmail(), c.getCpf()))
            .collect(Collectors.toList());
    }

    public ClienteResponseDTO findById(String id) {
        Cliente c = repository.findById(id);
        if (c == null) throw new BusinessException("CLIENTE NÃO ENCONTRADO");
        return new ClienteResponseDTO(c.getId(), c.getNome(), c.getSobrenome(), c.getEmail(), c.getCpf());
    }
    
    public ClienteResponseDTO update(String id, Cliente dto) {
        Cliente c = repository.findById(id);
        if (c == null) throw new BusinessException("CLIENTE NÃO ENCONTRADO");
        if(dto.getNome() != null) c.setNome(dto.getNome());
        if(dto.getSobrenome() != null) c.setSobrenome(dto.getSobrenome());
        if(dto.getEmail() != null) c.setEmail(dto.getEmail());
        repository.update(c);
        return new ClienteResponseDTO(c.getId(), c.getNome(), c.getSobrenome(), c.getEmail(), c.getCpf());
    }
}
"@;

"src\main\java\br\com\nonna_ai\controller\ClienteController.java" = @"
package br.com.nonna_ai.controller;
import br.com.nonna_ai.dto.ClienteResponseDTO;
import br.com.nonna_ai.entity.Cliente;
import br.com.nonna_ai.service.ClienteService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/clientes")
public class ClienteController {
    private final ClienteService service;
    public ClienteController(ClienteService service) { this.service = service; }

    @GetMapping
    public List<ClienteResponseDTO> findAll(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "30") int size) {
        if(size > 100) size = 100;
        return service.findAll(page, size);
    }

    @GetMapping("/{id}")
    public ClienteResponseDTO findById(@PathVariable String id) { return service.findById(id); }

    @PutMapping("/{id}")
    public ClienteResponseDTO update(@PathVariable String id, @RequestBody Cliente dto) { return service.update(id, dto); }
}
"@;

}
foreach ($entry in $files.GetEnumerator()) {
    $path = $entry.Key
    $content = $entry.Value
    Set-Content -Path $path -Value $content -Encoding UTF8
}
Write-Host "Service part 2 done."
