package br.com.nonna_ai.service;
import br.com.nonna_ai.dto.ReservaRequestDTO;
import br.com.nonna_ai.entity.Reserva;
import br.com.nonna_ai.exception.BusinessException;
import br.com.nonna_ai.repository.ReservaRepository;
import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.UUID;

@Service
public class ReservaService {
    private final ReservaRepository repository;
    public ReservaService(ReservaRepository repository) { this.repository = repository; }

    public Reserva create(ReservaRequestDTO dto) {
        Reserva r = new Reserva();
        r.setId(UUID.randomUUID().toString());
        r.setIdCliente(dto.idCliente());
        r.setHorario(dto.horario());
        r.setQuantidadePessoas(dto.quantidadePessoas());
        r.setTipoEvento(dto.tipoEvento());
        repository.save(r);
        return r;
    }

    public Reserva cancelar(String id, String motivo) {
        Reserva r = repository.findById(id);
        if (r == null) throw new BusinessException("RESERVA NÃƒO ENCONTRADA");
        r.setMotivoCancelamento(motivo);
        repository.update(r);
        return r;
    }
}
