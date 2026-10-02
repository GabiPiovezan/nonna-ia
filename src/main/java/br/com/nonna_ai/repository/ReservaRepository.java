package br.com.nonna_ai.repository;
import br.com.nonna_ai.entity.Reserva;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.sql.Timestamp;

@Repository
public class ReservaRepository {
    private final JdbcTemplate jdbcTemplate;
    public ReservaRepository(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    private RowMapper<Reserva> rowMapper = (rs, rowNum) -> {
        Reserva r = new Reserva();
        r.setId(rs.getString("id"));
        r.setIdCliente(rs.getString("id_cliente"));
        Timestamp h = rs.getTimestamp("horario");
        if(h != null) r.setHorario(h.toLocalDateTime());
        r.setQuantidadePessoas(rs.getInt("quantidade_pessoas"));
        r.setTipoEvento(rs.getString("tipo_evento"));
        r.setMotivoCancelamento(rs.getString("motivo_cancelamento"));
        return r;
    };

    public void save(Reserva r) {
        jdbcTemplate.update("INSERT INTO reserva (id, id_cliente, horario, quantidade_pessoas, tipo_evento, motivo_cancelamento) VALUES (?, ?, ?, ?, ?, ?)",
            r.getId(), r.getIdCliente(), r.getHorario(), r.getQuantidadePessoas(), r.getTipoEvento(), r.getMotivoCancelamento());
    }

    public Reserva findById(String id) {
        List<Reserva> list = jdbcTemplate.query("SELECT * FROM reserva WHERE id = ?", rowMapper, id);
        return list.isEmpty() ? null : list.get(0);
    }
    
    public void update(Reserva r) {
        jdbcTemplate.update("UPDATE reserva SET motivo_cancelamento=? WHERE id=?", r.getMotivoCancelamento(), r.getId());
    }
}
