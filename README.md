# Workshop Dev de Testes

👋 Olá, Seja Bem-vindo(a) ao Workshop de dev de testes unitários com Rspec.

Neste Workshop iremos aprender:  
1° Configurar Rspec no Rails.  
2° Validar a tabela User gerada pela Devise.  
3° Gerar objetos com FactoryBot.  
4° Utilizar Macthers do Rspec em testes unitários.  
5° Uso do Shoulda Matchers no Rails.

# Exigências

**:warning: Atenção:** É necessário que os desenvolvedores usem o Docker no seu ambiente de desenvolvimento.

- **🛠 Modo Desenvolvimento Docker**
    - :computer: [Linux Ubuntu LTS](https://ubuntu.com/download/desktop)
    - 🐳 [Docker](https://docs.docker.com/engine/installation/) Deve estar instalado.
    - 🐳 [Docker Compose](https://docs.docker.com/compose/) Deve estar instalado.
    - **💡 Dica:** [Documentação do Docker](https://docs.docker.com/)

# Instalando

## 🐳 Modo Desenvolvimento com Docker

Após instalar o docker e docker-compose, estando na pasta raiz do projeto, execute:

```sh
docker-compose up
```

Para se certificar que os seus containers subiram corretamente, todos os containers deve estar com o status `UP`, execute:

```sh
docker-compose ps -a
```

Para acessar o container da aplicação, execute:

```sh
docker-compose run --rm web bash
```

Para acessar a instância do banco de dados, execute:

```sh
docker exec -it [nome do db] bash
```

Para derrubar e subir a instância do docker novamente, execute:

```sh
docker-compose down && docker-compose up
```
# Popular o banco
Acesse o container da aplicação, execute:

```sh
docker-compose run --rm web bash
```
## Apagar banco existente, criar, rodar migrações e popular o banco

Dentro do container da aplicação, execute:

```sh
rails db:reset
```
## Criar, rodar migrações e popular o banco

Dentro do container da aplicação, execute:

```sh
rails db:setup
```
## Em um banco recém criado

Dentro do container da aplicação, execute:

```sh
rails db:seed
```

🚀 :clap: Para visualizar o sistema basta acessar no navegador no endereço: [localhost:3000](localhost:3000)

# Como executar a Suíte de Teste

### Testes Unitários com Rspec, em um novo terminal execute:
```sh
docker-compose run --rm web bash
```

```sh
RAILS_ENV=test rails db:create
```

```sh
RAILS_ENV=test rails db:migrate
```

```sh
rspec
```
# Referências utilizadas

[1° Criar docker-compose para Ruby on Rails](https://docs.docker.com/compose/rails/)  
[2° Onebitcode - Como gerenciar as permissões (autorização) no Rails usando o Devise + CanCanCan](https://onebitcode.com/permissoes-de-acesso-rails-usando-devise-e-cancancan/)  
[3° Documentação do Rspec no Relishapp](https://relishapp.com/rspec)  
[4° Documentação do Rspec no RubyDoc](https://rubydoc.info/gems/rspec-rails/frames)  
[5° Better Specs for Rspec in Ruby on Rails](https://rubydoc.info/gems/rspec-rails/frames)  
[6° Shoulda Macthers IO](https://matchers.shoulda.io/)  
[7° Shoulda Macther Repository](https://github.com/thoughtbot/shoulda-matchers)
