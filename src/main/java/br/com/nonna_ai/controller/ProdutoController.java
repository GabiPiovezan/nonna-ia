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

    public ProdutoController(ProdutoService service) {
        this.service = service;
    }

    @PostMapping
    public ProdutoResponseDTO create(@Valid @RequestBody ProdutoRequestDTO dto) {
        return service.create(dto);
    }

    @GetMapping
    public List<ProdutoResponseDTO> findAll(@RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "30") int size) {
        if (size > 100)
            size = 100;
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
