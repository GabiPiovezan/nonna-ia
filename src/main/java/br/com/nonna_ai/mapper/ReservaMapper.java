package br.com.nonna_ai.mapper;

import br.com.nonna_ai.dto.ReservaRequestDTO;
import br.com.nonna_ai.dto.ReservaResponseDto;
import br.com.nonna_ai.entity.Reserva;
import org.springframework.stereotype.Component;

@Component
public class ReservaMapper {
    public Reserva toEntity(ReservaRequestDTO dto) {
        Reserva e = new Reserva();
        e.setIdCliente(dto.getIdCliente());
        e.setHorario(dto.getHorario());
        e.setQuantidadePessoas(dto.getQuantidadePessoas());
        e.setTipoEvento(dto.getTipoEvento());
        return e;
    }

    public ReservaResponseDto toResponseDto(Reserva e) {
        ReservaResponseDto dto = new ReservaResponseDto();
        dto.setId(e.getId());
        dto.setIdCliente(e.getIdCliente());
        dto.setHorario(e.getHorario());
        dto.setQuantidadePessoas(e.getQuantidadePessoas());
        dto.setTipoEvento(e.getTipoEvento());
        dto.setMotivoCancelamento(e.getMotivoCancelamento());
        return dto;
    }
}