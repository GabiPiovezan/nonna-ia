package br.com.nonna_ai.dto;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
public record ProdutoRequestDTO(@NotBlank String nome, String descricao, @NotNull Double preco, @NotBlank String idCategoria, String imagem) {}
