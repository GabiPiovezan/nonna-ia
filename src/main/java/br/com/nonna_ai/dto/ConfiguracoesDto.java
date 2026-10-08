package br.com.nonna_ai.dto;
import jakarta.validation.constraints.NotBlank;
public class ConfiguracoesDto {
    @NotBlank(message = "Horário de funcionamento é obrigatório")
    private String horarioFuncionamento;
    public String getHorarioFuncionamento() { return horarioFuncionamento; }
    public void setHorarioFuncionamento(String horarioFuncionamento) { this.horarioFuncionamento = horarioFuncionamento; }
}