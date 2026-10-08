package br.com.nonna_ai.dto;

public record ProdutoResponseDTO(String id, String nome, String descricao, Double preco, String idCategoria,
        String imagem) {

        public void setNome(String nome2) {
                // TODO Auto-generated method stub
                throw new UnsupportedOperationException("Unimplemented method 'setNome'");
        }

        public void setId(String id2) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'setId'");
        }

        public void setDescricao(String descricao2) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'setDescricao'");
        }

        public void setPreco(Double preco2) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'setPreco'");
        }

        public void setIdCategoria(String idCategoria2) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'setIdCategoria'");
        }

        public void setImagem(String imagem2) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'setImagem'");
        }
}
