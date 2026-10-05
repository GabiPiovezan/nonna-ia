# Estado: 00 - Criação API Básica

## O que foi criado
- Configuração do ambiente com Java 25 (Amazon Corretto) e setup do `docker-compose.yml` para rodar o banco de dados MySQL 8.0.
- Script de inicialização do banco (`schema.sql`) gerado a partir do DER fornecido, utilizando UUID para chaves primárias e popularizando dados de exemplos.
- Estrutura completa do projeto seguindo a arquitetura em camadas (Controller -> Service -> Repository).
- Classes `Entity` mapeando o banco sem uso de ORM (apenas POJOs).
- Camada de `Repository` utilizando `JdbcTemplate` para consultas puras ao banco, com regras especiais como a listagem de pedidos ordenados pelos mais antigos não concluídos.
- Camada de `Service` controlando a lógica de negócio (cancelamentos, geração de UUIDs).
- DTOs integrados com `@Valid` para validação de payload no padrão Spring Boot.
- Componentes do tipo `Mapper` (`br.com.nonna_ai.mapper`) extraindo a lógica de conversão DTO <-> Entity, limpando as assinaturas e implementação dos `Controllers`.
- Tratamento global de exceções via `@RestControllerAdvice` padronizando respostas de erro com um formato pré-definido.
- Respostas paginadas (`PageDto`) padronizadas (tamanho 30 e limitador máximo de 100).
- Adicionada rota `GET /configuracoes` para leitura das configurações gerais do restaurante.
- **Documentação de API:**
  - Gerado o documento OpenAPI/Swagger (`api-docs/openapi.yaml`) especificando as URLs, tipagens e responses da API.
  - Criada coleção exportável do Bruno (`api-docs/bruno-collection/`) no padrão de arquivos Git-native `.bru` separados por pastas (Categorias, Clientes, Configuracoes, Pedidos, Produtos e Reservas).

## Decisões tomadas
- Optado por subir a versão base do Spring Boot Plugin para a **4.1.1**, dado o suporte nativo ao major class version 69 (Java 25).
- Tratamento de exceções formatando retorno padronizado de erro HTTP, sem expor traces do sistema diretamente para os usuários.
- Isolamento da lógica de mapeamento nos `Mappers` (anotados com `@Component`) com injeção de dependência nos construtores dos `Controllers`, promovendo clareza e manutenção do código (Clean Code).
- Simplificação dos *imports* nos controllers para não poluir as assinaturas dos métodos REST com nomes qualificados de pacotes.
- Limitação (`LIMIT 1`) na busca via repositório de configurações para assegurar que apenas uma configuração global seja lida por vez.

## O que foi testado
- Compilação dos arquivos base pelo Maven com sucesso usando `./mvnw clean compile`.
- Geração final do `.jar` usando `./mvnw clean package -DskipTests` com Spring Boot 4.1.1.
- Execução do serviço usando `./mvnw spring-boot:run` validando que a subida do servidor no Tomcat (porta 8080) ocorre sem exceções ou erros de *bytecodes* (Major version 69 error resolvido).
- Teste prático de compatibilidade da coleção `.bru` simulando falhas de sintaxe e ajustando cabeçalhos vazios (`headers {}`) para suportar corretamente as chamadas GET e DELETE.

## Pós Code-Review
- Implementada persistência e listagem dos **itens de um pedido** (`ProdutoPedido`), que estavam sendo ignorados anteriormente. O `PedidoDto` e `PedidoResponseDto` agora aceitam e retornam a lista de `ProdutoPedidoDto`.
- Todos os endpoints (Controllers) pararam de vazar entidades diretas do banco. Foi implementado o padrão de retorno com `ResponseDto` (ex: `ClienteResponseDto`), o que oculta corretamente informações sensíveis como a `senha` do usuário.
- Adicionada a anotação `@Transactional` nos métodos de escrita da camada `Service` (ex: `criar`, `atualizar`, `cancelar`), garantindo atomicidade e evitando inconsistências no banco.
- Removidos os aliases `AS` manuais das queries puras, uma vez que o `BeanPropertyRowMapper` faz automaticamente o de-para de *snake_case* (banco) para *camelCase* (Java).