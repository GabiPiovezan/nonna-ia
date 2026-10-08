package br.com.nonna_ai.dto;

import java.util.List;

public record PedidoDetalheDTO(String id, String idCliente, Double precoTotal, String tipoEntrega, String endereco,
        String formaPagamento, String telefone, String status, String horarioCriacao, String horarioSaida,
        String horarioFinalizacao, String motivoCancelamento, List<ItemPedidoDTO> itens) {
    public record ItemPedidoDTO(String idProduto, Double preco) {
    }

    public String getIdCliente() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getIdCliente'");
    }

    public Double getPrecoTotal() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getPrecoTotal'");
    }

    public String getTipoEntrega() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getTipoEntrega'");
    }

    public String getEndereco() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getEndereco'");
    }

    public String getFormaPagamento() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getFormaPagamento'");
    }

    public String getTelefone() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getTelefone'");
    }
}
