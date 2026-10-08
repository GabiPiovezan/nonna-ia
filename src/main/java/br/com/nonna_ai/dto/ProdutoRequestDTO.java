package br.com.nonna_ai.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record ProdutoRequestDTO(@NotBlank String nome, String descricao, @NotNull Double preco,
        @NotBlank String idCategoria, String imagem) {

    public String getNome() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getNome'");
    }

    public String getDescricao() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getDescricao'");
    }

    public Double getPreco() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getPreco'");
    }

    public String getIdCategoria() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getIdCategoria'");
    }

    public String getImagem() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getImagem'");
    }
}
