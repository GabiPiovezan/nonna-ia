package br.com.nonna_ai.dto;

public record ProdutoResponseDTO(String id, String nome, String descricao, Double preco, String idCategoria,
        String imagem) {
}
