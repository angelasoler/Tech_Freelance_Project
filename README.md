<h1 align="center">
  :woman_technologist: TECH FREELANCERS WEB APP
</h1>

<p align="center">
  <img alt="repository size" src="https://img.shields.io/github/repo-size/angelasoler/Tech_Freelance_Project">
  
  <img alt="languanges" src="https://img.shields.io/github/languages/count/angelasoler/Tech_Freelance_Project">

  <img alt="last commit" src="https://img.shields.io/github/last-commit/angelasoler/Tech_Freelance_Project">

  <img alt="issues" src="https://img.shields.io/github/issues/angelasoler/Tech_Freelance_Project">
</p>

[PRÉ-REQUISITOS](https://github.com/angelasoler/Tech_Freelance_Project#clipboard-pr%C3%A9-requisitos) | [PROJETO](https://github.com/angelasoler/Tech_Freelance_Project#computer-projeto) | [CONSTRUÍDO COM](https://github.com/angelasoler/Tech_Freelance_Project#hammer_and_wrench-constru%C3%ADdo-com) | [PASSO A PASSO PARA CLONAR E NAVEGAR O PROJETO](https://github.com/angelasoler/Tech_Freelance_Project#gear-passo-a-passo-para-clonar-e-navegar-o-projeto) | [DADOS DE USUÁRIOS PARA LOGIN](https://github.com/angelasoler/Tech_Freelance_Project#raising_hand-dados-de-usu%C3%A1rios-para-login) | [NAVEGANDO OS TESTES COMO DOCUMENTAÇÃO](https://github.com/angelasoler/Tech_Freelance_Project#nut_and_bolt-navegando-os-testes-como-documenta%C3%A7%C3%A3o) | [GEMS ADICIONAIS](https://github.com/angelasoler/Tech_Freelance_Project#gem-gems-adicionais)

## :clipboard: Pré-requisitos
  * Ruby On Rails '~> 6.1.4', '>= 6.1.4.1'
  * Ruby '2.7.0'
  * SQLite3 '~> 1.4'
  * Node.js '14.18.1'
  * Yarn '1.22.17'
  
  Veja a documentação [Getting Started with Rails](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails) para mais detalhes.

## :computer: PROJETO

Este projeto foi desenvolvido para a primeira etapa do treinamento em desenvolvimento de applicações web, com base em Ruby On Rails, do [TreinaDev](https://treinadev.com.br).
Permite postar projetos, receber e oferecer propostas e orçamentos, receber notificações via e-mail, com o objetivo de contratar profissionais de tecnologia freelancers.

## :hammer_and_wrench: CONSTRUÍDO COM

São usados os frameworks de teste e navegação [Rspec](https://relishapp.com/rspec/rspec-rails/v/4-0/docs) e [Capybara](https://github.com/teamcapybara/capybara#using-capybara-with-rspec) com a API [Rack Test](https://rubygems.org/gems/rack-test/versions/1.1.0) para desenvolver a aplicação através de TDD(Test Driven Development).

Também são usados os gems [Devise](https://github.com/heartcombo/devise) para autenticação de usuários e [devise-i18n](https://github.com/tigrish/devise-i18n) para tradução automática do Devise ao pt-BR.

Para melhorar o visual do Front-End é usado o framework [BootStrap](https://github.com/twbs/bootstrap-rubygem/blob/master/README.md#a-ruby-on-rails), veja também mais documentação sobre instalação e uso [aqui](https://getbootstrap.com/docs/4.3/getting-started/download/#rubygems).

## :gear: PASSO A PASSO PARA CLONAR E NAVEGAR O PROJETO
- Para instalar o projeto rode os seguintes comandos no seu terminal:

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

## :raising_hand: DADOS DE USUÁRIOS PARA LOGIN

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
       
  4. Ver conteúdo do arquivo
         ```
         cat <nome do arquivo>
         ```
       
   > Executar os testes
            ```
            rspec
            ```

## :gem: Gems adicionais

- [Should Matchers](https://matchers.shoulda.io/) para testes unitários mais resumidos

- [SimpleCov](https://github.com/simplecov-ruby/simplecov) para ver dados sobre cobertura de testes do projeto

- [FactoryBot](https://github.com/thoughtbot/factory_bot) cria variáveis para nossos testes facilitando a legibilidade e poupando tempo

- [Rubocop](https://rubocop.org/) verifica o estilo do código Ruby, ajudando a manter bons padrões


