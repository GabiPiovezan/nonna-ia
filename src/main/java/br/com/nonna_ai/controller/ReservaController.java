package br.com.nonna_ai.controller;
import br.com.nonna_ai.dto.ReservaRequestDTO;
import br.com.nonna_ai.entity.Reserva;
import br.com.nonna_ai.service.ReservaService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/reserva")
public class ReservaController {
    private final ReservaService service;
    public ReservaController(ReservaService service) { this.service = service; }

    @PostMapping
    public Reserva create(@Valid @RequestBody ReservaRequestDTO dto) { return service.create(dto); }

    @PostMapping("/{id}/cancelar")
    public Reserva cancelar(@PathVariable String id, @RequestBody Map<String, String> body) {
        return service.cancelar(id, body.get("motivo"));
    }
}
