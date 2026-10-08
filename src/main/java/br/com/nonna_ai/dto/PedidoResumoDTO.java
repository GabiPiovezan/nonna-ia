package br.com.nonna_ai.dto;

public record PedidoResumoDTO(String id, String idCliente, Double precoTotal, String status, String horarioCriacao) {

    public void setId(String id2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setId'");
    }

    public void setIdProduto(String idProduto) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setIdProduto'");
    }

    public void setPreco(Double preco) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setPreco'");
    }
}
