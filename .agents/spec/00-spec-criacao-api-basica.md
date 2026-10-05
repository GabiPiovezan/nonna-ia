Vamos implementar a aplicação.
Preciso que você crie a aplicação do restaurante com o modelo de banco de dados em https://i.imgur.com/tIY5Xel.png.
Você deve implementar as seguintes rotas:
-----
Categorias
    POST /categorias -> administrador
        Essa rota cria categorias no banco de dados
    GET /categorias
        Essa rota busca todas as categorias presentes no banco
    PUT /categoria/:id -> administrador
        Essa rota edita alguma categoria no banco
    DELETE /categoria/:id -> administrador
        Essa rota remove alguma categoria no banco
Produtos
    POST /produtos -> administrador
        Essa rota cria um produto no banco
    GET /produtos
        Essa rota busca todos os produtos no banco
    GET /produtos/:id
        Essa rota busca um produto no banco
    PUT /produtos/:id  -> administrador
        Essa rota atualiza um produto no banco
    DELETE /produtos/:id -> administrador
        Essa rota remove um produto no banco
Pedido
    POST /pedidos -> cliente
        Criação de um pedido online
    GET /pedidos -> administrador
        Buscar todos os pedidos NÃO CONCLUÍDOS. Deve ser ordenado do mais atrasado e com status mais antigo. Não é necessário retornar todos os itens pedidos, para que seja mais performático.
    GET /pedidos/:id -> administrador ou próprio cliente
        Buscar dados de um pedido em específico. Retornar todos os itens do pedido.
    PUT /pedidos/:id -> administrador
        Alterar o status do pedido e/ou horários (saída,etc).
    POST /pedidos/:id/cancelar -> administrador ou próprio cliente
        Cancelamento feito pelo cliente ou pelo administrador. Caso tenha sido cancelado pelo administrador, deve retornar o motivo.
Cliente
    GET /clientes -> administrador
        Buscar uma lista de clientes
    GET /clientes/:id -> administrador ou próprio cliente
        Buscar dados de um cliente em específico
    PUT /clientes/:id -> próprio cliente
        Alterar informações do cliente
Reserva
    POST /reserva -> cliente
        Criação de uma reserva
    POST /reserva/:id/cancelar -> administrador ou próprio cliente
        Cancelamento feito pelo cliente ou pelo administrador. Caso tenha sido cancelado pelo administrador, deve retornar o motivo.
Configurações
    POST /configurações -> administrador
        Configurações referentes ao restaurante
----
Todos os campos devem ser validados antes de qualquer chamada. Caso o usuário escreva algo incorreto, deve ser retornado o seguinte template:

{
    "status": STATUS_ERRO,
    "erros": [
        "USUÁRIO NÃO ENCONTRADO",
        "ID DO USUÁRIO INVÁLIDO"
    ],
    "horario": "2026-09-30..."
}

Para validação, utilizar anotações com o padrão Spring.
Utilizar DTO + Entity.

Paginação Todos as rotas com retorno de mais de um dado, devem estar paginadas com padrão de 30 e máximo de 100.

Pode também já instalar o java 25 coretto/maven (bare metal) e rodar o mysql em docker (com docker-compose).

Os campos do banco de dados serão feitos de forma padrão. Tenha em mente que todos os ids serão feitos usando UUID criados diretamente pelo back end.

Preciso que você me retorne um SQL para que eu possa adicionar no banco de dados as tabelas.
Tenha em mente que, como não adicionaremos o sistema de Login por enquanto, você precisa também adicionar alguns usuários de exemplo, além do próprio administrador.
Não precisa adicionar, ao menos por enquanto, autorização ou autenticação, deixe todas as rotas livres até implementarmos na próxima vez.