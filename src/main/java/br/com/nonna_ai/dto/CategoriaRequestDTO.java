package br.com.nonna_ai.dto;

import jakarta.validation.constraints.NotBlank;

public record CategoriaRequestDTO(@NotBlank String nome) {

    public String getNome() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getNome'");
    }
}
