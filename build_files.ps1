$files = @{
"src\main\java\br\com\nonna_ai\entity\Administrador.java" = @"
package br.com.nonna_ai.entity;

public class Administrador {
    private String id;
    private String email;
    private String senha;
    public Administrador() {}
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getSenha() { return senha; }
    public void setSenha(String senha) { this.senha = senha; }
}
"@;

"src\main\java\br\com\nonna_ai\entity\Categoria.java" = @"
package br.com.nonna_ai.entity;

public class Categoria {
    private String id;
    private String nome;
    public Categoria() {}
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
}
"@;

"src\main\java\br\com\nonna_ai\entity\Produto.java" = @"
package br.com.nonna_ai.entity;

public class Produto {
    private String id;
    private String nome;
    private String descricao;
    private Double preco;
    private String idCategoria;
    private String imagem;
    public Produto() {}
    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public Double getPreco() { return preco; }
    public void setPreco(Double preco) { this.preco = preco; }
    public String getIdCategoria() { return idCategoria; }
    public void setIdCategoria(String idCategoria) { this.idCategoria = idCategoria; }
    public String getImagem() { return imagem; }
    public void setImagem(String imagem) { this.imagem = imagem; }
}
"@;

"src\main\java\br\com\nonna_ai\entity\Cliente.java" = @"
package br.com.nonna_ai.entity;

public class Cliente {
    private String id;
    private String cpf;
    private String nome;
    private String sobrenome;
    private String email;
    private String senha;
    public Cliente() {}
    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getCpf() { return cpf; }
    public void setCpf(String cpf) { this.cpf = cpf; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getSobrenome() { return sobrenome; }
    public void setSobrenome(String sobrenome) { this.sobrenome = sobrenome; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getSenha() { return senha; }
    public void setSenha(String senha) { this.senha = senha; }
}
"@;

"src\main\java\br\com\nonna_ai\entity\Pedido.java" = @"
package br.com.nonna_ai.entity;
import java.time.LocalDateTime;

public class Pedido {
    private String id;
    private String idCliente;
    private Double precoTotal;
    private String tipoEntrega;
    private String endereco;
    private String formaPagamento;
    private LocalDateTime horarioCriacao;
    private LocalDateTime horarioSaida;
    private LocalDateTime horarioFinalizacao;
    private String telefone;
    private String status;
    private String motivoCancelamento;
    public Pedido() {}
    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdCliente() { return idCliente; }
    public void setIdCliente(String idCliente) { this.idCliente = idCliente; }
    public Double getPrecoTotal() { return precoTotal; }
    public void setPrecoTotal(Double precoTotal) { this.precoTotal = precoTotal; }
    public String getTipoEntrega() { return tipoEntrega; }
    public void setTipoEntrega(String tipoEntrega) { this.tipoEntrega = tipoEntrega; }
    public String getEndereco() { return endereco; }
    public void setEndereco(String endereco) { this.endereco = endereco; }
    public String getFormaPagamento() { return formaPagamento; }
    public void setFormaPagamento(String formaPagamento) { this.formaPagamento = formaPagamento; }
    public LocalDateTime getHorarioCriacao() { return horarioCriacao; }
    public void setHorarioCriacao(LocalDateTime horarioCriacao) { this.horarioCriacao = horarioCriacao; }
    public LocalDateTime getHorarioSaida() { return horarioSaida; }
    public void setHorarioSaida(LocalDateTime horarioSaida) { this.horarioSaida = horarioSaida; }
    public LocalDateTime getHorarioFinalizacao() { return horarioFinalizacao; }
    public void setHorarioFinalizacao(LocalDateTime horarioFinalizacao) { this.horarioFinalizacao = horarioFinalizacao; }
    public String getTelefone() { return telefone; }
    public void setTelefone(String telefone) { this.telefone = telefone; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getMotivoCancelamento() { return motivoCancelamento; }
    public void setMotivoCancelamento(String motivoCancelamento) { this.motivoCancelamento = motivoCancelamento; }
}
"@;

"src\main\java\br\com\nonna_ai\entity\ProdutoPedido.java" = @"
package br.com.nonna_ai.entity;

public class ProdutoPedido {
    private String id;
    private String idPedido;
    private String idProduto;
    private Double preco;
    public ProdutoPedido() {}
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdPedido() { return idPedido; }
    public void setIdPedido(String idPedido) { this.idPedido = idPedido; }
    public String getIdProduto() { return idProduto; }
    public void setIdProduto(String idProduto) { this.idProduto = idProduto; }
    public Double getPreco() { return preco; }
    public void setPreco(Double preco) { this.preco = preco; }
}
"@;

"src\main\java\br\com\nonna_ai\entity\Reserva.java" = @"
package br.com.nonna_ai.entity;
import java.time.LocalDateTime;

public class Reserva {
    private String id;
    private String idCliente;
    private LocalDateTime horario;
    private Integer quantidadePessoas;
    private String tipoEvento;
    private String motivoCancelamento;
    public Reserva() {}
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getIdCliente() { return idCliente; }
    public void setIdCliente(String idCliente) { this.idCliente = idCliente; }
    public LocalDateTime getHorario() { return horario; }
    public void setHorario(LocalDateTime horario) { this.horario = horario; }
    public Integer getQuantidadePessoas() { return quantidadePessoas; }
    public void setQuantidadePessoas(Integer quantidadePessoas) { this.quantidadePessoas = quantidadePessoas; }
    public String getTipoEvento() { return tipoEvento; }
    public void setTipoEvento(String tipoEvento) { this.tipoEvento = tipoEvento; }
    public String getMotivoCancelamento() { return motivoCancelamento; }
    public void setMotivoCancelamento(String motivoCancelamento) { this.motivoCancelamento = motivoCancelamento; }
}
"@;

"src\main\java\br\com\nonna_ai\entity\Configuracao.java" = @"
package br.com.nonna_ai.entity;

public class Configuracao {
    private String id;
    private String horarioFuncionamento;
    public Configuracao() {}
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getHorarioFuncionamento() { return horarioFuncionamento; }
    public void setHorarioFuncionamento(String horarioFuncionamento) { this.horarioFuncionamento = horarioFuncionamento; }
}
"@;

"src\main\java\br\com\nonna_ai\dto\ErrorResponseDTO.java" = @"
package br.com.nonna_ai.dto;
import java.util.List;

public record ErrorResponseDTO(Integer status, List<String> erros, String horario) {}
"@;

"src\main\java\br\com\nonna_ai\dto\CategoriaRequestDTO.java" = @"
package br.com.nonna_ai.dto;
import jakarta.validation.constraints.NotBlank;
public record CategoriaRequestDTO(@NotBlank String nome) {}
"@;

"src\main\java\br\com\nonna_ai\dto\CategoriaResponseDTO.java" = @"
package br.com.nonna_ai.dto;
public record CategoriaResponseDTO(String id, String nome) {}
"@;

"src\main\java\br\com\nonna_ai\dto\ProdutoRequestDTO.java" = @"
package br.com.nonna_ai.dto;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
public record ProdutoRequestDTO(@NotBlank String nome, String descricao, @NotNull Double preco, @NotBlank String idCategoria, String imagem) {}
"@;

"src\main\java\br\com\nonna_ai\dto\ProdutoResponseDTO.java" = @"
package br.com.nonna_ai.dto;
public record ProdutoResponseDTO(String id, String nome, String descricao, Double preco, String idCategoria, String imagem) {}
"@;

"src\main\java\br\com\nonna_ai\repository\CategoriaRepository.java" = @"
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
"@;

"src\main\java\br\com\nonna_ai\repository\ProdutoRepository.java" = @"
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
        jdbcTemplate.update("INSERT INTO produto (id, nome, descricao, preco, id_categoria, imagem) VALUES (?, ?, ?, ?, ?, ?)",
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
"@;

"src\main\java\br\com\nonna_ai\repository\PedidoRepository.java" = @"
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

Write-Host "Files generated."
