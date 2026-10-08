package br.com.nonna_ai.mapper;

import br.com.nonna_ai.dto.ConfiguracoesDto;
import br.com.nonna_ai.dto.ConfiguracoesResponseDto;
import br.com.nonna_ai.entity.Configuracao;
import org.springframework.stereotype.Component;

@Component
public class ConfiguracoesMapper {
    public Configuracao toEntity(ConfiguracoesDto dto) {
        Configuracao e = new Configuracao();
        e.setHorarioFuncionamento(dto.getHorarioFuncionamento());
        return e;
    }

    public ConfiguracoesResponseDto toResponseDto(Configuracao e) {
        ConfiguracoesResponseDto dto = new ConfiguracoesResponseDto();
        dto.setId(e.getId());
        dto.setHorarioFuncionamento(e.getHorarioFuncionamento());
        return dto;
    }
}