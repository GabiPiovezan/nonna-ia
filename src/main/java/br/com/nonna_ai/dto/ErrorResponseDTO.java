package br.com.nonna_ai.dto;
import java.util.List;

public record ErrorResponseDTO(Integer status, List<String> erros, String horario) {}
