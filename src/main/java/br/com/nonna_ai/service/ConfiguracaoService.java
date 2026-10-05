package br.com.nonna_ai.service;

import br.com.nonna_ai.entity.Configuracao;
import br.com.nonna_ai.repository.ConfiguracaoRepository;
import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.UUID;

@Service
public class ConfiguracaoService {
    private final ConfiguracaoRepository repository;

    public ConfiguracaoService(ConfiguracaoRepository repository) {
        this.repository = repository;
    }

    public Configuracao update(Map<String, String> body) {
        Configuracao c = new Configuracao();
        c.setId(UUID.randomUUID().toString());
        c.setHorarioFuncionamento(body.get("horario_funcionamento"));
        repository.saveOrUpdate(c);
        return c;
    }
}
