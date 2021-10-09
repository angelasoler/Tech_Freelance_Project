require 'rails_helper'

describe 'projecto owner register a project' do
  it 'successfully' do
    
    visit root_path
    click_on 'Registrar projeto'
    fill_in 'Título:' with: 'Site para comercio local'
    fill_in 'Descrição:' with: 'Site como fotos de produto e contato para pedido em domicilo'
    fill_in 'Habilidades desejadas:' with: 'Desenvolvedor fullstack com experiencia previa'
    fill_in 'Valor maximo por hora:' with: 60
    check 'Presencial:'
    check 'remoto:'
    click_on 'Registrar'
    
    expect(page).to have_css('h1', text: 'Site para comercio local')
    expect(page).to have_css('h3', text: 'Site como fotos de produto e contato para pedido em domicilo')
    expect(page).to have_css('h3', text: 'Desenvolvedor fullstack com experiencia previa')
    expect(page).to have_content('Valor maximo por hora: R$60')
    expect(page).to have_content('Presencial: sim')
    expect(page).to have_content('Remoto: sim')    
  end

  it 'and fields must be fill'

  visit root_path
  click_on 'Registrar projeto'
  fill_in 'Título:' with: 
  fill_in 'Descrição:' with: 
  fill_in 'Habilidades desejadas:' with: 
  fill_in 'Valor maximo por hora:' with: 
  click_on 'Registrar'

  expect(page).to have_content('Título não pode ficar em branco.')
  expect(page).to have_content('Descrição não pode ficar em branco.')
  expect(page).to have_content('Habilidades desejadas não pode ficar em branco.')
  expect(page).to have_content('Valor maximo por hora não pode ficar em branco.')
  end
end