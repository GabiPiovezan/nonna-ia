package br.com.nonna_ai.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;
import java.util.List;

public record PedidoRequestDTO(@NotBlank String idCliente, @NotBlank String tipoEntrega, String endereco,
        @NotBlank String formaPagamento, String telefone, @NotNull List<ItemPedidoDTO> itens) {
    public record ItemPedidoDTO(@NotBlank String idProduto, @NotNull Double preco) {
    }

    public void setId(String id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setId'");
    }

    public void setIdCliente(String idCliente2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setIdCliente'");
    }

    public void setPrecoTotal(Double precoTotal) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setPrecoTotal'");
    }

    public void setTipoEntrega(String tipoEntrega2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setTipoEntrega'");
    }

    public void setEndereco(String endereco2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setEndereco'");
    }

    public void setFormaPagamento(String formaPagamento2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setFormaPagamento'");
    }

    public void setHorarioCriacao(LocalDateTime horarioCriacao) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setHorarioCriacao'");
    }

    public void setHorarioSaida(LocalDateTime horarioSaida) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setHorarioSaida'");
    }

    public void setHorarioFinalizacao(LocalDateTime horarioFinalizacao) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setHorarioFinalizacao'");
    }

    public void setTelefone(String telefone2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setTelefone'");
    }

    public void setStatus(String status) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setStatus'");
    }

    public void setMotivoCancelamento(String motivoCancelamento) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setMotivoCancelamento'");
    }

    public String getIdProduto() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getIdProduto'");
    }

    public Double getPreco() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getPreco'");
    }
}
