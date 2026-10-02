package br.com.nonna_ai.service;
import br.com.nonna_ai.dto.ClienteResponseDTO;
import br.com.nonna_ai.entity.Cliente;
import br.com.nonna_ai.exception.BusinessException;
import br.com.nonna_ai.repository.ClienteRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ClienteService {
    private final ClienteRepository repository;
    public ClienteService(ClienteRepository repository) { this.repository = repository; }

    public List<ClienteResponseDTO> findAll(int page, int size) {
        return repository.findAll(size, page * size).stream()
            .map(c -> new ClienteResponseDTO(c.getId(), c.getNome(), c.getSobrenome(), c.getEmail(), c.getCpf()))
            .collect(Collectors.toList());
    }

    public ClienteResponseDTO findById(String id) {
        Cliente c = repository.findById(id);
        if (c == null) throw new BusinessException("CLIENTE NÃƒO ENCONTRADO");
        return new ClienteResponseDTO(c.getId(), c.getNome(), c.getSobrenome(), c.getEmail(), c.getCpf());
    }
    
    public ClienteResponseDTO update(String id, Cliente dto) {
        Cliente c = repository.findById(id);
        if (c == null) throw new BusinessException("CLIENTE NÃƒO ENCONTRADO");
        if(dto.getNome() != null) c.setNome(dto.getNome());
        if(dto.getSobrenome() != null) c.setSobrenome(dto.getSobrenome());
        if(dto.getEmail() != null) c.setEmail(dto.getEmail());
        repository.update(c);
        return new ClienteResponseDTO(c.getId(), c.getNome(), c.getSobrenome(), c.getEmail(), c.getCpf());
    }
}
