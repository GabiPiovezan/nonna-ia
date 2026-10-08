package br.com.nonna_ai.mapper;

import br.com.nonna_ai.dto.ProdutoRequestDTO;
import br.com.nonna_ai.dto.ProdutoResponseDTO;
import br.com.nonna_ai.entity.Produto;
import org.springframework.stereotype.Component;

@Component
public class ProdutoMapper {
    public Produto toEntity(ProdutoRequestDTO dto) {
        Produto e = new Produto();
        e.setNome(dto.getNome());
        e.setDescricao(dto.getDescricao());
        e.setPreco(dto.getPreco());
        e.setIdCategoria(dto.getIdCategoria());
        e.setImagem(dto.getImagem());
        return e;
    }

    public ProdutoResponseDTO toResponseDto(Produto e) {
        ProdutoResponseDTO dto = new ProdutoResponseDTO();
        dto.setId(e.getId());
        dto.setNome(e.getNome());
        dto.setDescricao(e.getDescricao());
        dto.setPreco(e.getPreco());
        dto.setIdCategoria(e.getIdCategoria());
        dto.setImagem(e.getImagem());
        return dto;
    }
}