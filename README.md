<h1 align="center">
  :woman_technologist: TECH FREELANCERS WEB APP
</h1>

## :clipboard: Pré-requisitos
  * Ruby
  * SQLite3
  * Node.js
  * Yarn
  
  Veja a documentação [Getting Started with Rails](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails) para mais detalhes.

## :computer: PROJETO

Este projeto foi desenvolvido para a primeira etapa do treinamento em desenvolvimento de applicativos web, com base em Ruby On Rails, do [TreinaDev](https://treinadev.com.br).
Permite postar projetos, receber e oferecer propostas e orçamentos, receber notificações via email, com o objetivo de contratar profissionais de tecnologia freelancers.

## :hammer_and_wrench: CONSTRUIDO COM

São usados os frameworks de teste e navegação [Rspec](https://relishapp.com/rspec/rspec-rails/v/4-0/docs) e [Capybara](https://github.com/teamcapybara/capybara#using-capybara-with-rspec) com a API [Rack Test](https://rubygems.org/gems/rack-test/versions/1.1.0) para desenvolver a aplição atravez de TDD(Test Driven Development).

Tambem são usados os gems [Devise](https://github.com/heartcombo/devise) para autenticação de usuarios e [devise-i18n](https://github.com/tigrish/devise-i18n) para tradução automatica do Devise ao pt-BR.

Para melhorar o visual do Front-End é usado o framework [BootStrap](https://github.com/twbs/bootstrap-rubygem/blob/master/README.md#a-ruby-on-rails), veja tambem mais documentação sobre installação e uso [aqui](https://getbootstrap.com/docs/4.3/getting-started/download/#rubygems).

## :gear: PASSO A PASSO PARA CLONAR E NAVEGAR O PROJETO
- Para intalar o projeto rode os seguintes comandos no seu terminal:

  ```
  git clone https://github.com/angelasoler/Tech_Freelance_Project.git
  ```
  ```
  cd Tech_Freelance_Project
  ```
  ```
  bundle install
  ```
  ```
  yarn install
  ```
  ```
  rails db:create
  ```
  ```
  rails db:migrate
  ```
  ```
  rails db:seed
  ```
- Para navegar no projeto

  ```
  rails db:migration:reset
  ```
  ```
  rails s
  ```
Abra este [link](http://localhost:3000/) no seu navegador

## :raising_hand: DADOS DE USUARIOS PARA LOGIN

<p align="center">
  ********
  <em>Senha para qualquer usuario: 123456</em>
  ********
</p>


  | Freelancers         | Donos de projetos       |
  |:-------------------:|:-----------------------:|
  | pablo@mail.com      | panaderia@mail.com      |
  | pedro@mail.com      | magazineluizar@mail.com |
  | andrea@mail.com     | vendemosroupa@mail.com  |
  | claudia@mail.com    | cursosdeingles@mail.com |
  | sem_perfil@mail.com |


 > Para verificar os dados com os quais está populado o banco de dados    
      ```
      cat db/seeds.rb
      ```
## :nut_and_bolt: NAVEGANDO OS TESTES COMO DOCUMENTAÇÃO
 
 1. Entre na pasta 'spec'
         ```
         cd spec
         ```
   > _```ls``` mostra o que tem dentro da pasta_
   > 
   > _```cd ..``` retorna á pasta anterior_

  2.1. Na pasta 'system' encontra-se a documentação de interface
       ```
       cd system
       ```
 
  2.2. Na pasta 'models' encontra-se a documentação de cenarios de borda
       ```
       cd models
       ```

  2.3. Na pasta 'request' documentação sobre autenticação e atorização
       ```
       cd request
       ```
 
  3. Listando os arquivos de tests dentro de cada pasta
         ```
         ls
         ```
       
  4. Ver conteudo do arquivo
         ```
         cat <nome do arquivo>
         ```
       
   > Executar os testes
            ```
            rspec
            ```

## :gem: Gems adicionais:

- [should matchers](https://matchers.shoulda.io/) para testes unitarios mais resumidos

- [simplecov](https://github.com/simplecov-ruby/simplecov) para ver dados sobre covertura de testes do projeto

- [factorybot](https://github.com/thoughtbot/factory_bot) cria variaves para nossos testes facilitando a legibilidade e poupando tempo

- [rubocop](https://rubocop.org/) verifica o estilo do código Ruby, ajudando a manter bons padrões


