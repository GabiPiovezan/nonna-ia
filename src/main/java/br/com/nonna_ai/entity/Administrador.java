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
