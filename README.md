# Sistema de Gestão de Pedidos

## Descrição
- Sistema de gestão de pedidos em construção. Desenvolvido em Delphi seguindo os princípios de Domain-Driven Design (DDD) e SOLID.
- Parte significativa do cadastro de clientes está concluida.
- Faltam validações de email e telefone mais robustas. 

- Outros módulos a construir:
- Cadastro de Produtos
- Registro de Pedidos

## Tecnologias
- Delphi 12 Community Edition
- VCL para interface gráfica
- Generics.Collections para armazenamento em memória

## Como Executar
1. Abra o projeto no Delphi 12 Community Edition
2. Compile o projeto (Ctrl + F9)
3. Execute (F9)

## Arquitetura
- Domain: Entidades e interfaces (TCliente)
- Application: Serviços e casos de uso (ClienteService)
- Infrastructure: Implementações (ClienteRepositoryMemory)
- Presentation: Formulários VCL (FormClienteCadastro)

## Decisões Técnicas
- Armazenamento em memória usando TObjectList<T> para simplicidade e demonstração
- Injeção de dependência para adequação ao SOLID
- Separação clara de responsabilidades entre camadas

## Padrões Utilizados
- Domain-Driven Design (DDD)
- Princípios SOLID
- Repository Pattern
- Service Layer Pattern
- Dependency Injection

## Observações
- O projeto representa um primeiro contato com os padrões utilizados de arquitetura utilizados. Falhas na arquitetura são esperadas e critícas e sugestões são bem vindas. 

## Contato 
  mellosiebrajunior@gmail.com
