package br.com.nonna_ai.mapper;

import br.com.nonna_ai.dto.PedidoDetalheDTO;
import br.com.nonna_ai.dto.PedidoRequestDTO;
import br.com.nonna_ai.entity.Pedido;
import org.springframework.stereotype.Component;

@Component
public class PedidoMapper {
    public Pedido toEntity(PedidoDetalheDTO dto) {
        Pedido e = new Pedido();
        e.setIdCliente(dto.getIdCliente());
        e.setPrecoTotal(dto.getPrecoTotal());
        e.setTipoEntrega(dto.getTipoEntrega());
        e.setEndereco(dto.getEndereco());
        e.setFormaPagamento(dto.getFormaPagamento());
        e.setTelefone(dto.getTelefone());
        return e;
    }

    public PedidoRequestDTO toResponseDto(Pedido e) {
        PedidoRequestDTO dto = new PedidoRequestDTO(null, null, null, null, null, null);
        dto.setId(e.getId());
        dto.setIdCliente(e.getIdCliente());
        dto.setPrecoTotal(e.getPrecoTotal());
        dto.setTipoEntrega(e.getTipoEntrega());
        dto.setEndereco(e.getEndereco());
        dto.setFormaPagamento(e.getFormaPagamento());
        dto.setHorarioCriacao(e.getHorarioCriacao());
        dto.setHorarioSaida(e.getHorarioSaida());
        dto.setHorarioFinalizacao(e.getHorarioFinalizacao());
        dto.setTelefone(e.getTelefone());
        dto.setStatus(e.getStatus());
        dto.setMotivoCancelamento(e.getMotivoCancelamento());
        return dto;
    }
}