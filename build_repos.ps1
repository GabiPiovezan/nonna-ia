$files = @{
"src\main\java\br\com\nonna_ai\repository\ClienteRepository.java" = @"
package br.com.nonna_ai.repository;
import br.com.nonna_ai.entity.Cliente;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class ClienteRepository {
    private final JdbcTemplate jdbcTemplate;
    public ClienteRepository(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

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
"@;

"src\main\java\br\com\nonna_ai\repository\ReservaRepository.java" = @"
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
"@;

"src\main\java\br\com\nonna_ai\repository\ConfiguracaoRepository.java" = @"
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
"@;

"src\main\java\br\com\nonna_ai\repository\ProdutoPedidoRepository.java" = @"
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
"@;
}

foreach ($entry in $files.GetEnumerator()) {
    $path = $entry.Key
    $content = $entry.Value
    $dir = Split-Path $path
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    Set-Content -Path $path -Value $content -Encoding UTF8
}

Write-Host "Repos generated."
