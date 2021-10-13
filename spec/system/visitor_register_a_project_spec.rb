require 'rails_helper'

describe 'projecto owner register a project' do
  before do
    user = Owner.create!({email: 'user@mail.com', 
                          password:'123456'}
                        )
    login_as user, :scope => :owner
  end
  
  it 'successfully' do
    visit root_path
    click_on 'Publique um projeto'
    fill_in 'Título:', with: 'Site para comercio local'
    fill_in 'Descrição:', with: 'Site como fotos de produto e contato para pedido em domicilo'
    fill_in 'Habilidades desejadas:', with: 'Desenvolvedor fullstack com experiencia previa'
    fill_in 'Valor maximo por hora:', with: 60
    fill_in 'Data limite proposta:', with: Time.now + 2.month
    check 'Presencial:'
    check 'Remoto:'
    click_on 'Cadastrar'
    
    expect(page).to have_css('h1', text: 'Site para comercio local')
    expect(page).to have_css('h3', text: 'Site como fotos de produto e contato para pedido em domicilo')
    expect(page).to have_css('h3', text: 'Desenvolvedor fullstack com experiencia previa')
    expect(page).to have_content('Valor maximo por hora: R$ 60')
    expect(page).to have_content('Presencial: Sim')
    expect(page).to have_content('Remoto: Sim')    
  end

  it 'and fields must be fill' do

  visit root_path
  click_on 'Publique um projeto'
  click_on 'Cadastrar'

  expect(page).to have_content('Título não pode ficar em branco')
  expect(page).to have_content('Descrição não pode ficar em branco')
  expect(page).to have_content('Habilidades desejadas não pode ficar em branco')
  expect(page).to have_content('Valor maximo por hora não pode ficar em branco')
  # expect(page).to have_content('Por favor selecione: Presencial ou Remoto')
  end
end

# [TODO] verificar formato da data, e preços com fracções