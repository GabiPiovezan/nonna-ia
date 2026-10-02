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
