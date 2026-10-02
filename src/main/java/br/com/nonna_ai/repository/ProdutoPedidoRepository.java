package br.com.nonna_ai.repository;
import br.com.nonna_ai.entity.ProdutoPedido;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class ProdutoPedidoRepository {
    private final JdbcTemplate jdbcTemplate;
    public ProdutoPedidoRepository(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    private RowMapper<ProdutoPedido> rowMapper = (rs, rowNum) -> {
        ProdutoPedido pp = new ProdutoPedido();
        pp.setId(rs.getString("id"));
        pp.setIdPedido(rs.getString("id_pedido"));
        pp.setIdProduto(rs.getString("id_produto"));
        pp.setPreco(rs.getDouble("preco"));
        return pp;
    };

    public void save(ProdutoPedido pp) {
        jdbcTemplate.update("INSERT INTO produto_pedido (id, id_pedido, id_produto, preco) VALUES (?, ?, ?, ?)",
            pp.getId(), pp.getIdPedido(), pp.getIdProduto(), pp.getPreco());
    }

    public List<ProdutoPedido> findByPedidoId(String pedidoId) {
        return jdbcTemplate.query("SELECT * FROM produto_pedido WHERE id_pedido = ?", rowMapper, pedidoId);
    }
}
