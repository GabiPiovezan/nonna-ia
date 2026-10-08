package br.com.nonna_ai.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDateTime;

public record ReservaRequestDTO(@NotBlank String idCliente, @NotNull LocalDateTime horario,
        @NotNull Integer quantidadePessoas, String tipoEvento) {

    public String getIdCliente() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getIdCliente'");
    }

    public LocalDateTime getHorario() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getHorario'");
    }

    public Integer getQuantidadePessoas() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getQuantidadePessoas'");
    }

    public String getTipoEvento() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getTipoEvento'");
    }
}
