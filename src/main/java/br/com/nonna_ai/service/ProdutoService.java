package br.com.nonna_ai.service;

import br.com.nonna_ai.dto.ProdutoRequestDTO;
import br.com.nonna_ai.dto.ProdutoResponseDTO;
import br.com.nonna_ai.entity.Produto;
import br.com.nonna_ai.exception.BusinessException;
import br.com.nonna_ai.repository.ProdutoRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class ProdutoService {
    private final ProdutoRepository repository;

    public ProdutoService(ProdutoRepository repository) {
        this.repository = repository;
    }

    public ProdutoResponseDTO create(ProdutoRequestDTO dto) {
        Produto p = new Produto();
        p.setId(UUID.randomUUID().toString());
        p.setNome(dto.nome());
        p.setDescricao(dto.descricao());
        p.setPreco(dto.preco());
        p.setIdCategoria(dto.idCategoria());
        p.setImagem(dto.imagem());
        repository.save(p);
        return toDTO(p);
    }

    public List<ProdutoResponseDTO> findAll(int page, int size) {
        return repository.findAll(size, page * size).stream().map(this::toDTO).collect(Collectors.toList());
    }

    public ProdutoResponseDTO findById(String id) {
        Produto p = repository.findById(id);
        if (p == null)
            throw new BusinessException("PRODUTO NÃƒO ENCONTRADO");
        return toDTO(p);
    }

    public ProdutoResponseDTO update(String id, ProdutoRequestDTO dto) {
        Produto p = repository.findById(id);
        if (p == null)
            throw new BusinessException("PRODUTO NÃƒO ENCONTRADO");
        p.setNome(dto.nome());
        p.setDescricao(dto.descricao());
        p.setPreco(dto.preco());
        p.setIdCategoria(dto.idCategoria());
        p.setImagem(dto.imagem());
        repository.update(p);
        return toDTO(p);
    }

    public void delete(String id) {
        Produto p = repository.findById(id);
        if (p == null)
            throw new BusinessException("PRODUTO NÃƒO ENCONTRADO");
        repository.delete(id);
    }

    private ProdutoResponseDTO toDTO(Produto p) {
        return new ProdutoResponseDTO(p.getId(), p.getNome(), p.getDescricao(), p.getPreco(), p.getIdCategoria(),
                p.getImagem());
    }
}
