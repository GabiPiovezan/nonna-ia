package br.com.nonna_ai.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.util.List;

public record PedidoRequestDTO(@NotBlank String idCliente, @NotBlank String tipoEntrega, String endereco,
        @NotBlank String formaPagamento, String telefone, @NotNull List<ItemPedidoDTO> itens) {
    public record ItemPedidoDTO(@NotBlank String idProduto, @NotNull Double preco) {
    }
}
