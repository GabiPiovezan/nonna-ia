package br.com.nonna_ai.dto;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDateTime;
public record ReservaRequestDTO(@NotBlank String idCliente, @NotNull LocalDateTime horario, @NotNull Integer quantidadePessoas, String tipoEvento) {}
