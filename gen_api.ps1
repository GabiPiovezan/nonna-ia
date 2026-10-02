$openapi = @"
openapi: 3.0.3
info:
  title: Cantina da Nonna API
  version: 1.0.0
servers:
  - url: http://localhost:8080
paths:
  /categorias:
    get:
      summary: Listar categorias
      responses:
        '200':
          description: Sucesso
    post:
      summary: Criar categoria
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                nome:
                  type: string
      responses:
        '200':
          description: Sucesso
  /categorias/{id}:
    put:
      summary: Editar categoria
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                nome:
                  type: string
      responses:
        '200':
          description: Sucesso
    delete:
      summary: Remover categoria
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      responses:
        '200':
          description: Sucesso
  /produtos:
    get:
      summary: Listar produtos
      responses:
        '200':
          description: Sucesso
    post:
      summary: Criar produto
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                nome:
                  type: string
                descricao:
                  type: string
                preco:
                  type: number
                idCategoria:
                  type: string
                imagem:
                  type: string
      responses:
        '200':
          description: Sucesso
  /produtos/{id}:
    get:
      summary: Buscar produto
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      responses:
        '200':
          description: Sucesso
    put:
      summary: Editar produto
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                nome:
                  type: string
                descricao:
                  type: string
                preco:
                  type: number
                idCategoria:
                  type: string
                imagem:
                  type: string
      responses:
        '200':
          description: Sucesso
    delete:
      summary: Remover produto
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      responses:
        '200':
          description: Sucesso
  /pedidos:
    get:
      summary: Listar pedidos (Nao concluidos)
      responses:
        '200':
          description: Sucesso
    post:
      summary: Criar pedido
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                idCliente:
                  type: string
                tipoEntrega:
                  type: string
                endereco:
                  type: string
                formaPagamento:
                  type: string
                telefone:
                  type: string
                itens:
                  type: array
                  items:
                    type: object
                    properties:
                      idProduto:
                        type: string
                      preco:
                        type: number
      responses:
        '200':
          description: Sucesso
  /pedidos/{id}:
    get:
      summary: Buscar detalhes do pedido
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      responses:
        '200':
          description: Sucesso
    put:
      summary: Atualizar status do pedido
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                status:
                  type: string
      responses:
        '200':
          description: Sucesso
  /pedidos/{id}/cancelar:
    post:
      summary: Cancelar pedido
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                motivo:
                  type: string
      responses:
        '200':
          description: Sucesso
  /clientes:
    get:
      summary: Listar clientes
      responses:
        '200':
          description: Sucesso
  /clientes/{id}:
    get:
      summary: Buscar cliente
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      responses:
        '200':
          description: Sucesso
    put:
      summary: Atualizar cliente
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                nome:
                  type: string
                sobrenome:
                  type: string
                email:
                  type: string
      responses:
        '200':
          description: Sucesso
  /reserva:
    post:
      summary: Criar reserva
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                idCliente:
                  type: string
                horario:
                  type: string
                  format: date-time
                quantidadePessoas:
                  type: integer
                tipoEvento:
                  type: string
      responses:
        '200':
          description: Sucesso
  /reserva/{id}/cancelar:
    post:
      summary: Cancelar reserva
      parameters:
        - in: path
          name: id
          required: true
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                motivo:
                  type: string
      responses:
        '200':
          description: Sucesso
  /configuracoes:
    post:
      summary: Salvar configuracoes
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                horario_funcionamento:
                  type: string
      responses:
        '200':
          description: Sucesso
"@

$brunoJson = @"
{
  "version": "1",
  "name": "Nonna AI API",
  "type": "collection",
  "ignore": [
    "node_modules",
    ".git"
  ]
}
"@

$brunoFiles = @{
"Categorias/Listar.bru" = @"
meta {
  name: Listar Categorias
  type: http
  seq: 1
}
get {
  url: http://localhost:8080/categorias
  body: none
  auth: none
}
"@;

"Categorias/Criar.bru" = @"
meta {
  name: Criar Categoria
  type: http
  seq: 2
}
post {
  url: http://localhost:8080/categorias
  body: json
  auth: none
}
body:json {
  {
    "nome": "Bebidas"
  }
}
"@;

"Categorias/Editar.bru" = @"
meta {
  name: Editar Categoria
  type: http
  seq: 3
}
put {
  url: http://localhost:8080/categorias/cat-uuid-1
  body: json
  auth: none
}
body:json {
  {
    "nome": "Massas Atualizadas"
  }
}
"@;

"Categorias/Remover.bru" = @"
meta {
  name: Remover Categoria
  type: http
  seq: 4
}
delete {
  url: http://localhost:8080/categorias/cat-uuid-2
  body: none
  auth: none
}
"@;

"Produtos/Listar.bru" = @"
meta {
  name: Listar Produtos
  type: http
  seq: 1
}
get {
  url: http://localhost:8080/produtos
  body: none
  auth: none
}
"@;

"Produtos/Buscar.bru" = @"
meta {
  name: Buscar Produto
  type: http
  seq: 2
}
get {
  url: http://localhost:8080/produtos/prod-uuid-1
  body: none
  auth: none
}
"@;

"Produtos/Criar.bru" = @"
meta {
  name: Criar Produto
  type: http
  seq: 3
}
post {
  url: http://localhost:8080/produtos
  body: json
  auth: none
}
body:json {
  {
    "nome": "Pizza Margherita",
    "descricao": "Molho de tomate, mussarela e manjericão.",
    "preco": 60.00,
    "idCategoria": "cat-uuid-1",
    "imagem": "url_imagem_pizza"
  }
}
"@;

"Pedidos/Criar.bru" = @"
meta {
  name: Criar Pedido
  type: http
  seq: 1
}
post {
  url: http://localhost:8080/pedidos
  body: json
  auth: none
}
body:json {
  {
    "idCliente": "cliente-uuid-1",
    "tipoEntrega": "Entrega",
    "endereco": "Rua X, 123",
    "formaPagamento": "Cartão de Crédito",
    "telefone": "11999999999",
    "itens": [
      {
        "idProduto": "prod-uuid-1",
        "preco": 45.90
      }
    ]
  }
}
"@;

"Pedidos/Listar Nao Concluidos.bru" = @"
meta {
  name: Listar Nao Concluidos
  type: http
  seq: 2
}
get {
  url: http://localhost:8080/pedidos
  body: none
  auth: none
}
"@;

"Pedidos/Atualizar Status.bru" = @"
meta {
  name: Atualizar Status
  type: http
  seq: 3
}
put {
  url: http://localhost:8080/pedidos/ID_DO_PEDIDO
  body: json
  auth: none
}
body:json {
  {
    "status": "SAIU_PARA_ENTREGA"
  }
}
"@;

"Pedidos/Cancelar.bru" = @"
meta {
  name: Cancelar Pedido
  type: http
  seq: 4
}
post {
  url: http://localhost:8080/pedidos/ID_DO_PEDIDO/cancelar
  body: json
  auth: none
}
body:json {
  {
    "motivo": "Demora na entrega"
  }
}
"@;

"Clientes/Listar.bru" = @"
meta {
  name: Listar Clientes
  type: http
  seq: 1
}
get {
  url: http://localhost:8080/clientes
  body: none
  auth: none
}
"@;

"Clientes/Buscar.bru" = @"
meta {
  name: Buscar Cliente
  type: http
  seq: 2
}
get {
  url: http://localhost:8080/clientes/cliente-uuid-1
  body: none
  auth: none
}
"@;

"Reservas/Criar.bru" = @"
meta {
  name: Criar Reserva
  type: http
  seq: 1
}
post {
  url: http://localhost:8080/reserva
  body: json
  auth: none
}
body:json {
  {
    "idCliente": "cliente-uuid-1",
    "horario": "2026-10-15T20:00:00",
    "quantidadePessoas": 4,
    "tipoEvento": "Aniversário"
  }
}
"@;

"Configuracoes/Atualizar.bru" = @"
meta {
  name: Atualizar Config
  type: http
  seq: 1
}
post {
  url: http://localhost:8080/configuracoes
  body: json
  auth: none
}
body:json {
  {
    "horario_funcionamento": "18:00 - 23:59"
  }
}
"@;
}

$baseDir = "C:\Users\gabriella62318596\Desktop\Dev\nonna-ai-back\api"
if (!(Test-Path $baseDir)) { New-Item -ItemType Directory -Force -Path $baseDir | Out-Null }

Set-Content -Path "$baseDir\openapi.yaml" -Value $openapi -Encoding UTF8

$brunoDir = "$baseDir\bruno"
if (!(Test-Path $brunoDir)) { New-Item -ItemType Directory -Force -Path $brunoDir | Out-Null }
Set-Content -Path "$brunoDir\bruno.json" -Value $brunoJson -Encoding UTF8

foreach ($entry in $brunoFiles.GetEnumerator()) {
    $path = "$brunoDir\" + $entry.Key
    $dir = Split-Path $path
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    Set-Content -Path $path -Value $entry.Value -Encoding UTF8
}

Write-Host "API docs generated."
