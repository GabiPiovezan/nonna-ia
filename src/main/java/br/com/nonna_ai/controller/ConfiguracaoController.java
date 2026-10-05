package br.com.nonna_ai.controller;

import br.com.nonna_ai.entity.Configuracao;
import br.com.nonna_ai.service.ConfiguracaoService;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/configuracoes")
public class ConfiguracaoController {
    private final ConfiguracaoService service;

    public ConfiguracaoController(ConfiguracaoService service) {
        this.service = service;
    }

    @PostMapping
    public Configuracao update(@RequestBody Map<String, String> body) {
        return service.update(body);
    }
}
