package br.com.nonna_ai.repository;
import br.com.nonna_ai.entity.Categoria;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class CategoriaRepository {
    private final JdbcTemplate jdbcTemplate;

    public CategoriaRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private RowMapper<Categoria> rowMapper = (rs, rowNum) -> {
        Categoria c = new Categoria();
        c.setId(rs.getString("id"));
        c.setNome(rs.getString("nome"));
        return c;
    };

    public void save(Categoria categoria) {
        jdbcTemplate.update("INSERT INTO categoria (id, nome) VALUES (?, ?)", categoria.getId(), categoria.getNome());
    }

    public List<Categoria> findAll(int limit, int offset) {
        return jdbcTemplate.query("SELECT * FROM categoria LIMIT ? OFFSET ?", rowMapper, limit, offset);
    }

    public Categoria findById(String id) {
        List<Categoria> list = jdbcTemplate.query("SELECT * FROM categoria WHERE id = ?", rowMapper, id);
        return list.isEmpty() ? null : list.get(0);
    }

    public void update(Categoria categoria) {
        jdbcTemplate.update("UPDATE categoria SET nome = ? WHERE id = ?", categoria.getNome(), categoria.getId());
    }

    public void delete(String id) {
        jdbcTemplate.update("DELETE FROM categoria WHERE id = ?", id);
    }
}
