package br.com.nonna_ai.dto;

public record ClienteResponseDTO(String id, String nome, String sobrenome, String email, String cpf) {

    public void setId(String id2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setId'");
    }

    public void setNome(String nome2){
        throw new  UnsupportedOperationException("implementando metodo 'setnome'");
    }

    public void setCpf(String cpf2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setCpf'");
    }

    public void setSobrenome(String sobrenome2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setSobrenome'");
    }

    public void setEmail(String email2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'setEmail'");
    }

}
