$files = @{
"src\main\java\br\com\nonna_ai\service\CategoriaService.java" = @"
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
        if (c == null) throw new BusinessException("CATEGORIA NÃO ENCONTRADA");
        c.setNome(dto.nome());
        repository.update(c);
        return new CategoriaResponseDTO(c.getId(), c.getNome());
    }

    public void delete(String id) {
        Categoria c = repository.findById(id);
        if (c == null) throw new BusinessException("CATEGORIA NÃO ENCONTRADA");
        repository.delete(id);
    }
}
"@;

"src\main\java\br\com\nonna_ai\controller\CategoriaController.java" = @"
package br.com.nonna_ai.controller;
import br.com.nonna_ai.dto.CategoriaRequestDTO;
import br.com.nonna_ai.dto.CategoriaResponseDTO;
import br.com.nonna_ai.service.CategoriaService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/categorias")
public class CategoriaController {
    private final CategoriaService service;
    public CategoriaController(CategoriaService service) { this.service = service; }

    @PostMapping
    public CategoriaResponseDTO create(@Valid @RequestBody CategoriaRequestDTO dto) {
        return service.create(dto);
    }

    @GetMapping
    public List<CategoriaResponseDTO> findAll(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "30") int size) {
        if(size > 100) size = 100;
        return service.findAll(page, size);
    }

    @PutMapping("/{id}")
    public CategoriaResponseDTO update(@PathVariable String id, @Valid @RequestBody CategoriaRequestDTO dto) {
        return service.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) {
        service.delete(id);
    }
}
"@;

"src\main\java\br\com\nonna_ai\service\ProdutoService.java" = @"
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
    public ProdutoService(ProdutoRepository repository) { this.repository = repository; }

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
        if (p == null) throw new BusinessException("PRODUTO NÃO ENCONTRADO");
        return toDTO(p);
    }

    public ProdutoResponseDTO update(String id, ProdutoRequestDTO dto) {
        Produto p = repository.findById(id);
        if (p == null) throw new BusinessException("PRODUTO NÃO ENCONTRADO");
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
        if (p == null) throw new BusinessException("PRODUTO NÃO ENCONTRADO");
        repository.delete(id);
    }
    
    private ProdutoResponseDTO toDTO(Produto p) {
        return new ProdutoResponseDTO(p.getId(), p.getNome(), p.getDescricao(), p.getPreco(), p.getIdCategoria(), p.getImagem());
    }
}
"@;

"src\main\java\br\com\nonna_ai\controller\ProdutoController.java" = @"
package br.com.nonna_ai.controller;
import br.com.nonna_ai.dto.ProdutoRequestDTO;
import br.com.nonna_ai.dto.ProdutoResponseDTO;
import br.com.nonna_ai.service.ProdutoService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/produtos")
public class ProdutoController {
    private final ProdutoService service;
    public ProdutoController(ProdutoService service) { this.service = service; }

    @PostMapping
    public ProdutoResponseDTO create(@Valid @RequestBody ProdutoRequestDTO dto) {
        return service.create(dto);
    }

    @GetMapping
    public List<ProdutoResponseDTO> findAll(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "30") int size) {
        if(size > 100) size = 100;
        return service.findAll(page, size);
    }

    @GetMapping("/{id}")
    public ProdutoResponseDTO findById(@PathVariable String id) {
        return service.findById(id);
    }

    @PutMapping("/{id}")
    public ProdutoResponseDTO update(@PathVariable String id, @Valid @RequestBody ProdutoRequestDTO dto) {
        return service.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) {
        service.delete(id);
    }
}
"@;

}
foreach ($entry in $files.GetEnumerator()) {
    $path = $entry.Key
    $content = $entry.Value
    Set-Content -Path $path -Value $content -Encoding UTF8
}
Write-Host "Service part 1 done."
