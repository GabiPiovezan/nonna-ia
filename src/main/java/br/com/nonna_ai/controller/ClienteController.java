package br.com.nonna_ai.controller;

import br.com.nonna_ai.dto.ClienteResponseDTO;
import br.com.nonna_ai.entity.Cliente;
import br.com.nonna_ai.service.ClienteService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/clientes")
public class ClienteController {
    private final ClienteService service;

    public ClienteController(ClienteService service) {
        this.service = service;
    }

    @GetMapping
    public List<ClienteResponseDTO> findAll(@RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "30") int size) {
        if (size > 100)
            size = 100;
        return service.findAll(page, size);
    }

    @GetMapping("/{id}")
    public ClienteResponseDTO findById(@PathVariable String id) {
        return service.findById(id);
    }

    @PutMapping("/{id}")
    public ClienteResponseDTO update(@PathVariable String id, @RequestBody Cliente dto) {
        return service.update(id, dto);
    }
}
