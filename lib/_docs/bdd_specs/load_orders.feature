Feature: Listar Enquetes
Como um cliente
Quero poder ver todas os pedidos
Para poder saber o resultado e poder acompanhar minhas vendas

Cenário: Com a API respondendo normalmente
Dado que o cliente tem conexão com a internet
Quando solicitar para ver os pedidos
Então o sistema deve exibir os pedidos

Cenário: Com a API fora do ar
Dado que o cliente não tem conexão com a internet
Quando solicitar para ver os pedidos
Então o sistema deve exibir os pedidos que forem gravados localmente no dispositivo