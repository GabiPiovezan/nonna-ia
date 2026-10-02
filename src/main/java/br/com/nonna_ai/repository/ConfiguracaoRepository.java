package br.com.nonna_ai.repository;
import br.com.nonna_ai.entity.Configuracao;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class ConfiguracaoRepository {
    private final JdbcTemplate jdbcTemplate;
    public ConfiguracaoRepository(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    private RowMapper<Configuracao> rowMapper = (rs, rowNum) -> {
        Configuracao c = new Configuracao();
        c.setId(rs.getString("id"));
        c.setHorarioFuncionamento(rs.getString("horario_funcionamento"));
        return c;
    };

    public Configuracao findFirst() {
        List<Configuracao> list = jdbcTemplate.query("SELECT * FROM configuracoes LIMIT 1", rowMapper);
        return list.isEmpty() ? null : list.get(0);
    }

    public void saveOrUpdate(Configuracao c) {
        Configuracao existing = findFirst();
        if(existing == null) {
            jdbcTemplate.update("INSERT INTO configuracoes (id, horario_funcionamento) VALUES (?, ?)", c.getId(), c.getHorarioFuncionamento());
        } else {
            jdbcTemplate.update("UPDATE configuracoes SET horario_funcionamento = ? WHERE id = ?", c.getHorarioFuncionamento(), existing.getId());
        }
    }
}
