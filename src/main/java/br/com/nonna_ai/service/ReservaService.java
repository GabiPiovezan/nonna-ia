package br.com.nonna_ai.service;

import br.com.nonna_ai.dto.ReservaRequestDTO;
import br.com.nonna_ai.entity.Reserva;
import br.com.nonna_ai.exception.BusinessException;
import br.com.nonna_ai.repository.ReservaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
public class ReservaService {

    private final ReservaRepository repository;

    public ReservaService(ReservaRepository repository) {
        this.repository = repository;
    }

    @Transactional
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

    @Transactional
    public Reserva cancelar(String id, String motivo) {
        Reserva r = repository.findById(id);
        if (r == null) {
            throw new BusinessException("Reserva não encontrada!");
        }
        r.setMotivoCancelamento(motivo);
        repository.update(r);
        return r;
    }
}
