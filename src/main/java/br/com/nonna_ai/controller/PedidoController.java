package br.com.nonna_ai.controller;
import br.com.nonna_ai.dto.PedidoRequestDTO;
import br.com.nonna_ai.dto.PedidoResumoDTO;
import br.com.nonna_ai.dto.PedidoDetalheDTO;
import br.com.nonna_ai.service.PedidoService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/pedidos")
public class PedidoController {
    private final PedidoService service;
    public PedidoController(PedidoService service) { this.service = service; }

    @PostMapping
    public PedidoResumoDTO create(@Valid @RequestBody PedidoRequestDTO dto) { return service.create(dto); }

    @GetMapping
    public List<PedidoResumoDTO> findNaoConcluidos(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "30") int size) {
        if(size > 100) size = 100;
        return service.findNaoConcluidos(page, size);
    }

    @GetMapping("/{id}")
    public PedidoDetalheDTO findById(@PathVariable String id) { return service.findById(id); }

    @PutMapping("/{id}")
    public PedidoResumoDTO updateStatus(@PathVariable String id, @RequestBody Map<String, String> body) {
        return service.updateStatus(id, body.get("status"));
    }

    @PostMapping("/{id}/cancelar")
    public PedidoResumoDTO cancelar(@PathVariable String id, @RequestBody Map<String, String> body) {
        return service.cancelar(id, body.get("motivo"));
    }
}
