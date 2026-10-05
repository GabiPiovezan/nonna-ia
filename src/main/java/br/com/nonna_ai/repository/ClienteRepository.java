package br.com.nonna_ai.repository;

import br.com.nonna_ai.entity.Cliente;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class ClienteRepository {
    private final JdbcTemplate jdbcTemplate;

    public ClienteRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private RowMapper<Cliente> rowMapper = (rs, rowNum) -> {
        Cliente c = new Cliente();
        c.setId(rs.getString("id"));
        c.setCpf(rs.getString("cpf"));
        c.setNome(rs.getString("nome"));
        c.setSobrenome(rs.getString("sobrenome"));
        c.setEmail(rs.getString("email"));
        c.setSenha(rs.getString("senha"));
        return c;
    };

    public List<Cliente> findAll(int limit, int offset) {
        return jdbcTemplate.query("SELECT * FROM cliente LIMIT ? OFFSET ?", rowMapper, limit, offset);
    }

    public Cliente findById(String id) {
        List<Cliente> list = jdbcTemplate.query("SELECT * FROM cliente WHERE id = ?", rowMapper, id);
        return list.isEmpty() ? null : list.get(0);
    }

    public void update(Cliente c) {
        jdbcTemplate.update("UPDATE cliente SET nome=?, sobrenome=?, cpf=?, email=? WHERE id=?",
                c.getNome(), c.getSobrenome(), c.getCpf(), c.getEmail(), c.getId());
    }
}
