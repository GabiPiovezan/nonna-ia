package br.com.nonna_ai.mapper;

import br.com.nonna_ai.dto.CategoriaRequestDTO;
import br.com.nonna_ai.dto.CategoriaResponseDTO;
import br.com.nonna_ai.entity.Categoria;
import org.springframework.stereotype.Component;

@Component
public class CategoriaMapper {
    public Categoria toEntity(CategoriaRequestDTO dto) {
        Categoria e = new Categoria();
        e.setNome(dto.getNome());
        return e;
    }

    public CategoriaResponseDTO toResponseDto(Categoria e) {
        CategoriaResponseDTO dto = new CategoriaResponseDTO();
        dto.setId(e.getId());
        dto.setNome(e.getNome());
        return dto;
    }
}