$files = @{
"src\main\java\br\com\nonna_ai\service\ReservaService.java" = @"
package br.com.nonna_ai.service;
import br.com.nonna_ai.dto.ReservaRequestDTO;
import br.com.nonna_ai.entity.Reserva;
import br.com.nonna_ai.exception.BusinessException;
import br.com.nonna_ai.repository.ReservaRepository;
import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.UUID;

@Service
public class ReservaService {
    private final ReservaRepository repository;
    public ReservaService(ReservaRepository repository) { this.repository = repository; }

    public Reserva create(ReservaRequestDTO dto) {
        Reserva r = new Reserva();
        r.setId(UUID.randomUUID().toString());
        r.setIdCliente(dto.idCliente());
        r.setHorario(dto.horario());
        r.setQuantidadePessoas(dto.quantidadePessoas());
        r.setTipoEvento(dto.tipoEvento());
        repository.save(r);
        return r;
    }

    public Reserva cancelar(String id, String motivo) {
        Reserva r = repository.findById(id);
        if (r == null) throw new BusinessException("RESERVA NÃO ENCONTRADA");
        r.setMotivoCancelamento(motivo);
        repository.update(r);
        return r;
    }
}
"@;

"src\main\java\br\com\nonna_ai\controller\ReservaController.java" = @"
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
"@;

"src\main\java\br\com\nonna_ai\service\ConfiguracaoService.java" = @"
package br.com.nonna_ai.service;
import br.com.nonna_ai.entity.Configuracao;
import br.com.nonna_ai.repository.ConfiguracaoRepository;
import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.UUID;

@Service
public class ConfiguracaoService {
    private final ConfiguracaoRepository repository;
    public ConfiguracaoService(ConfiguracaoRepository repository) { this.repository = repository; }

    public Configuracao update(Map<String, String> body) {
        Configuracao c = new Configuracao();
        c.setId(UUID.randomUUID().toString());
        c.setHorarioFuncionamento(body.get("horario_funcionamento"));
        repository.saveOrUpdate(c);
        return c;
    }
}
"@;

"src\main\java\br\com\nonna_ai\controller\ConfiguracaoController.java" = @"
package br.com.nonna_ai.controller;
import br.com.nonna_ai.entity.Configuracao;
import br.com.nonna_ai.service.ConfiguracaoService;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/configuracoes")
public class ConfiguracaoController {
    private final ConfiguracaoService service;
    public ConfiguracaoController(ConfiguracaoService service) { this.service = service; }

    @PostMapping
    public Configuracao update(@RequestBody Map<String, String> body) {
        return service.update(body);
    }
}
"@;
}

foreach ($entry in $files.GetEnumerator()) {
    $path = $entry.Key
    $content = $entry.Value
    Set-Content -Path $path -Value $content -Encoding UTF8
}
Write-Host "Service part 3 done."
