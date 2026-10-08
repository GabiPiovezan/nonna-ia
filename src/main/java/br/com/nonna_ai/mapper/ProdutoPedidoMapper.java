package br.com.nonna_ai.mapper;
import br.com.nonna_ai.dto.PedidoRequestDTO;
import br.com.nonna_ai.dto.PedidoResumoDTO;
import br.com.nonna_ai.entity.ProdutoPedido;
import org.springframework.stereotype.Component;
@Component
public class ProdutoPedidoMapper {
    public ProdutoPedido toEntity(PedidoRequestDTO dto) {
        ProdutoPedido e = new ProdutoPedido();
        e.setIdProduto(dto.getIdProduto());
        e.setPreco(dto.getPreco());
        return e;
    }
    public PedidoResumoDTO toResponseDto(ProdutoPedido e) {
        PedidoResumoDTO dto = new PedidoResumoDTO();
        dto.setId(e.getId());
        dto.setIdProduto(e.getIdProduto());
        dto.setPreco(e.getPreco());
        return dto;
    
}
}