package br.com.nonna_ai.repository;

import br.com.nonna_ai.entity.Produto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class ProdutoRepository {
    private final JdbcTemplate jdbcTemplate;

    public ProdutoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private RowMapper<Produto> rowMapper = (rs, rowNum) -> {
        Produto p = new Produto();
        p.setId(rs.getString("id"));
        p.setNome(rs.getString("nome"));
        p.setDescricao(rs.getString("descricao"));
        p.setPreco(rs.getDouble("preco"));
        p.setIdCategoria(rs.getString("id_categoria"));
        p.setImagem(rs.getString("imagem"));
        return p;
    };

    public void save(Produto p) {
        jdbcTemplate.update(
                "INSERT INTO produto (id, nome, descricao, preco, id_categoria, imagem) VALUES (?, ?, ?, ?, ?, ?)",
                p.getId(), p.getNome(), p.getDescricao(), p.getPreco(), p.getIdCategoria(), p.getImagem());
    }

    public List<Produto> findAll(int limit, int offset) {
        return jdbcTemplate.query("SELECT * FROM produto LIMIT ? OFFSET ?", rowMapper, limit, offset);
    }

    public Produto findById(String id) {
        List<Produto> list = jdbcTemplate.query("SELECT * FROM produto WHERE id = ?", rowMapper, id);
        return list.isEmpty() ? null : list.get(0);
    }

    public void update(Produto p) {
        jdbcTemplate.update("UPDATE produto SET nome=?, descricao=?, preco=?, id_categoria=?, imagem=? WHERE id=?",
                p.getNome(), p.getDescricao(), p.getPreco(), p.getIdCategoria(), p.getImagem(), p.getId());
    }

    public void delete(String id) {
        jdbcTemplate.update("DELETE FROM produto WHERE id = ?", id);
    }
}
