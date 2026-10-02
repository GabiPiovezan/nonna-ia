package br.com.nonna_ai.service;
import br.com.nonna_ai.dto.CategoriaRequestDTO;
import br.com.nonna_ai.dto.CategoriaResponseDTO;
import br.com.nonna_ai.entity.Categoria;
import br.com.nonna_ai.exception.BusinessException;
import br.com.nonna_ai.repository.CategoriaRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class CategoriaService {
    private final CategoriaRepository repository;
    public CategoriaService(CategoriaRepository repository) { this.repository = repository; }

    public CategoriaResponseDTO create(CategoriaRequestDTO dto) {
        Categoria c = new Categoria();
        c.setId(UUID.randomUUID().toString());
        c.setNome(dto.nome());
        repository.save(c);
        return new CategoriaResponseDTO(c.getId(), c.getNome());
    }

    public List<CategoriaResponseDTO> findAll(int page, int size) {
        return repository.findAll(size, page * size).stream()
            .map(c -> new CategoriaResponseDTO(c.getId(), c.getNome()))
            .collect(Collectors.toList());
    }

    public CategoriaResponseDTO update(String id, CategoriaRequestDTO dto) {
        Categoria c = repository.findById(id);
        if (c == null) throw new BusinessException("CATEGORIA NÃƒO ENCONTRADA");
        c.setNome(dto.nome());
        repository.update(c);
        return new CategoriaResponseDTO(c.getId(), c.getNome());
    }

    public void delete(String id) {
        Categoria c = repository.findById(id);
        if (c == null) throw new BusinessException("CATEGORIA NÃƒO ENCONTRADA");
        repository.delete(id);
    }
}
