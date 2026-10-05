package br.com.nonna_ai.controller;

import br.com.nonna_ai.dto.CategoriaRequestDTO;
import br.com.nonna_ai.dto.CategoriaResponseDTO;
import br.com.nonna_ai.service.CategoriaService;
import jakarta.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/categorias")
public class CategoriaController {
    private final CategoriaService service;

    public CategoriaController(CategoriaService service) {
        this.service = service;
    }

    @PostMapping
    public CategoriaResponseDTO create(@Valid @RequestBody CategoriaRequestDTO dto) {
        return service.create(dto);
    }

    @GetMapping
    public List<CategoriaResponseDTO> findAll(@RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "30") int size) {
        if (size > 100)
            size = 100;
        return service.findAll(page, size);
    }

    @PutMapping("/{id}")
    public CategoriaResponseDTO update(@PathVariable String id, @Valid @RequestBody CategoriaRequestDTO dto) {
        return service.update(id, dto);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        service.delete(id);
    }
}
