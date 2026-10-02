package br.com.nonna_ai.entity;

public class ProdutoPedido {
    private String id;
    private String idPedido;
    private String idProduto;
    private Double preco;
    public ProdutoPedido() {}
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdPedido() { return idPedido; }
    public void setIdPedido(String idPedido) { this.idPedido = idPedido; }
    public String getIdProduto() { return idProduto; }
    public void setIdProduto(String idProduto) { this.idProduto = idProduto; }
    public Double getPreco() { return preco; }
    public void setPreco(Double preco) { this.preco = preco; }
}
