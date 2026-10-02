package br.com.nonna_ai.dto;
import java.util.List;
public record PedidoDetalheDTO(String id, String idCliente, Double precoTotal, String tipoEntrega, String endereco, String formaPagamento, String telefone, String status, String horarioCriacao, String horarioSaida, String horarioFinalizacao, String motivoCancelamento, List<ItemPedidoDTO> itens) {
    public record ItemPedidoDTO(String idProduto, Double preco) {}
}
