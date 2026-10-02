package br.com.nonna_ai.repository;
import br.com.nonna_ai.entity.Pedido;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.sql.Timestamp;

@Repository
public class PedidoRepository {
    private final JdbcTemplate jdbcTemplate;
    
    public PedidoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    private RowMapper<Pedido> rowMapper = (rs, rowNum) -> {
        Pedido p = new Pedido();
        p.setId(rs.getString("id"));
        p.setIdCliente(rs.getString("id_cliente"));
        p.setPrecoTotal(rs.getDouble("preco_total"));
        p.setTipoEntrega(rs.getString("tipo_entrega"));
        p.setEndereco(rs.getString("endereco"));
        p.setFormaPagamento(rs.getString("forma_pagamento"));
        Timestamp criacao = rs.getTimestamp("horario_criacao");
        if(criacao != null) p.setHorarioCriacao(criacao.toLocalDateTime());
        Timestamp saida = rs.getTimestamp("horario_saida");
        if(saida != null) p.setHorarioSaida(saida.toLocalDateTime());
        Timestamp finalizacao = rs.getTimestamp("horario_finalizacao");
        if(finalizacao != null) p.setHorarioFinalizacao(finalizacao.toLocalDateTime());
        p.setTelefone(rs.getString("telefone"));
        p.setStatus(rs.getString("status"));
        p.setMotivoCancelamento(rs.getString("motivo_cancelamento"));
        return p;
    };

    public List<Pedido> findNaoConcluidos(int limit, int offset) {
        return jdbcTemplate.query("SELECT * FROM pedido WHERE status NOT IN ('CONCLUIDO', 'CANCELADO') ORDER BY horario_criacao ASC LIMIT ? OFFSET ?", rowMapper, limit, offset);
    }

    public Pedido findById(String id) {
        List<Pedido> list = jdbcTemplate.query("SELECT * FROM pedido WHERE id = ?", rowMapper, id);
        return list.isEmpty() ? null : list.get(0);
    }
    
    public void save(Pedido p) {
        jdbcTemplate.update("INSERT INTO pedido (id, id_cliente, preco_total, tipo_entrega, endereco, forma_pagamento, horario_criacao, telefone, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
            p.getId(), p.getIdCliente(), p.getPrecoTotal(), p.getTipoEntrega(), p.getEndereco(), p.getFormaPagamento(), p.getHorarioCriacao(), p.getTelefone(), p.getStatus());
    }

    public void update(Pedido p) {
        jdbcTemplate.update("UPDATE pedido SET status=?, horario_saida=?, horario_finalizacao=?, motivo_cancelamento=? WHERE id=?",
            p.getStatus(), p.getHorarioSaida(), p.getHorarioFinalizacao(), p.getMotivoCancelamento(), p.getId());
    }
}
