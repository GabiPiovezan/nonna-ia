package br.com.nonna_ai.dto;
import jakarta.validation.constraints.NotBlank;
public record CategoriaRequestDTO(@NotBlank String nome) {}
