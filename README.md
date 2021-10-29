# README

## PRE-REQUISITOS DE CONFIGURAÇÃO RECOMENDADOS
  Ruby
  SQLite3
  Node.js
  Yarn
  Veja a documentação [Getting Started with Rails](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails para mais detalhes.)
  
## PASSO A PASSO PARA CLONAR E NAVEGAR NO PROJETO
- Para intalar o projeto rode os seguintes comandos no seu terminal: 
```bash
git clone https://github.com/angelasoler/Tech_Freelance_Project.git
```
```bash
cd Tech_Freelance_Project
```
```bash
bin/setup
```
- Para navegar no projeto
```bash
rails db:reset
```
```bash
rails s
```
Abra este [link]http://localhost:3000/ no seu navegador
  ** Para verificar os dados com os quais está populado o banco de dados    
      ```
      cat db/seeds.rb
      ```
 - Para ver documentação atravez dos testes navegue a paste spec, na subpasta system encontra-se a documentação de interface, na pasta models documentação de cenarios de borda, e na pasta request documentação sobre autenticação e atorização.
    * O comando  ```rspec``` roda os testes.


## DESCRIÇÃO DO PROJETO

Aplicação web com Framework Ruby Rails.

Objetivo: Permitirá postar projetos para contratar profissionais de tecnologia freelancers, os quais oferecerão propostas  e orçamentos a ser aprovados ou rejeitados pelo dono do projeto. 

São usados os frameworks de teste e navegação [Rspec](https://relishapp.com/rspec/rspec-rails/v/4-0/docs) e [Capybara](https://github.com/teamcapybara/capybara#using-capybara-with-rspec) com a API [Rack Test](https://rubygems.org/gems/rack-test/versions/1.1.0) para desenvolver a aplição atravez de TDD(Test Driven Development).

Tambem são usados os gems [Devise](https://github.com/heartcombo/devise) para autenticação de usuarios e [devise-i18n](https://github.com/tigrish/devise-i18n) para tradução automatica do Devise ao pt-BR.

Para melhorar o visual do Front-End é usado o framework [BootStrap](https://github.com/twbs/bootstrap-rubygem/blob/master/README.md#a-ruby-on-rails), veja tambem mais documentação sobre installação e uso [aqui].

Outras gems adicionais:

[should matchers](https://matchers.shoulda.io/) para testes unitarios mais resumidos


