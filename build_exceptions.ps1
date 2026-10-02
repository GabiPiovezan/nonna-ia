$files = @{
"src\main\java\br\com\nonna_ai\exception\BusinessException.java" = @"
package br.com.nonna_ai.exception;
public class BusinessException extends RuntimeException {
    public BusinessException(String message) {
        super(message);
    }
}
"@;

"src\main\java\br\com\nonna_ai\exception\GlobalExceptionHandler.java" = @"
package br.com.nonna_ai.exception;
import br.com.nonna_ai.dto.ErrorResponseDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(BusinessException.class)
    public ResponseEntity<ErrorResponseDTO> handleBusinessException(BusinessException ex) {
        ErrorResponseDTO error = new ErrorResponseDTO(400, List.of(ex.getMessage()), LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
        return ResponseEntity.badRequest().body(error);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErrorResponseDTO> handleValidationException(MethodArgumentNotValidException ex) {
        List<String> erros = ex.getBindingResult().getFieldErrors().stream()
            .map(e -> e.getField() + ": " + e.getDefaultMessage())
            .collect(Collectors.toList());
        ErrorResponseDTO error = new ErrorResponseDTO(400, erros, LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
        return ResponseEntity.badRequest().body(error);
    }
    
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponseDTO> handleException(Exception ex) {
        ErrorResponseDTO error = new ErrorResponseDTO(500, List.of("Erro interno: " + ex.getMessage()), LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
        return ResponseEntity.internalServerError().body(error);
    }
}
"@;

"src\main\java\br\com\nonna_ai\dto\ClienteResponseDTO.java" = @"
package br.com.nonna_ai.dto;
public record ClienteResponseDTO(String id, String nome, String sobrenome, String email, String cpf) {}
"@;

"src\main\java\br\com\nonna_ai\dto\PedidoRequestDTO.java" = @"
package br.com.nonna_ai.dto;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.util.List;
public record PedidoRequestDTO(@NotBlank String idCliente, @NotBlank String tipoEntrega, String endereco, @NotBlank String formaPagamento, String telefone, @NotNull List<ItemPedidoDTO> itens) {
    public record ItemPedidoDTO(@NotBlank String idProduto, @NotNull Double preco) {}
}
"@;

"src\main\java\br\com\nonna_ai\dto\PedidoResumoDTO.java" = @"
package br.com.nonna_ai.dto;
public record PedidoResumoDTO(String id, String idCliente, Double precoTotal, String status, String horarioCriacao) {}
"@;

"src\main\java\br\com\nonna_ai\dto\PedidoDetalheDTO.java" = @"
package br.com.nonna_ai.dto;
import java.util.List;
public record PedidoDetalheDTO(String id, String idCliente, Double precoTotal, String tipoEntrega, String endereco, String formaPagamento, String telefone, String status, String horarioCriacao, String horarioSaida, String horarioFinalizacao, String motivoCancelamento, List<ItemPedidoDTO> itens) {
    public record ItemPedidoDTO(String idProduto, Double preco) {}
}
"@;

"src\main\java\br\com\nonna_ai\dto\ReservaRequestDTO.java" = @"
package br.com.nonna_ai.dto;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDateTime;
public record ReservaRequestDTO(@NotBlank String idCliente, @NotNull LocalDateTime horario, @NotNull Integer quantidadePessoas, String tipoEvento) {}
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
Write-Host "Exceptions and DTOs generated."
