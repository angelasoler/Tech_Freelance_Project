require 'rails_helper'

describe 'projecto owner register a project' do
  it 'successfully' do
    
    visit root_path
    click_on 'Cadastrar Projeto'
    fill_in 'Título:', with: 'Site para comercio local'
    fill_in 'Descrição:', with: 'Site como fotos de produto e contato para pedido em domicilo'
    fill_in 'Habilidades desejadas:', with: 'Desenvolvedor fullstack com experiencia previa'
    fill_in 'Valor maximo por hora:', with: 60
    fill_in 'Data limite proposta:', with: 2.months.from.now
    check 'Presencial:'
    check 'Remoto:'
    click_on 'Cadastrar'
    
    expect(page).to have_css('h1', text: 'Site para comercio local')
    expect(page).to have_css('h3', text: 'Site como fotos de produto e contato para pedido em domicilo')
    expect(page).to have_css('h3', text: 'Desenvolvedor fullstack com experiencia previa')
    expect(page).to have_content('Valor maximo por hora: R$60')
    expect(page).to have_content('Presencial: Sim')
    expect(page).to have_content('Remoto: Sim')    
  end

  it 'and fields must be fill' do

  visit root_path
  click_on 'Cadastrar Projeto'
  click_on 'Cadastrar'

  expect(page).to have_content('Título não pode ficar em branco.')
  expect(page).to have_content('Descrição não pode ficar em branco.')
  expect(page).to have_content('Habilidades desejadas não pode ficar em branco.')
  expect(page).to have_content('Valor maximo por hora não pode ficar em branco.')
  expect(project.count).to eq(0)
  end
end