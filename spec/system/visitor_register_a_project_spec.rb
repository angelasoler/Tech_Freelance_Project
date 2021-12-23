require 'rails_helper'

describe 'project owner register a project' do
  it 'successfully' do
    user = create(:owner)
    login_as user, scope: :owner
    data_limite = (DateTime.now + 2.months).strftime('%Y%m%d').to_i

    visit root_path
    click_on 'Publique um projeto'
    fill_in 'Título', with: 'Site para comercio local'
    fill_in 'Descrição',
            with: 'Site como fotos de produto e contato para pedido em domicilo'
    fill_in 'Habilidades desejadas',
            with: 'Desenvolvedor fullstack com experiencia previa'
    fill_in 'Valor maximo por hora', with: 60
    fill_in 'Data limite para proposta', with: data_limite
    check 'Presencial'
    check 'Remoto'
    click_on 'Cadastrar'

    expect(page).to have_css('h5', text: 'Site para comercio local')
    expect(page).to have_content('Site como fotos de produto e contato para pedido em domicilo')
    expect(page).to have_content('Desenvolvedor fullstack com experiencia previa')
    expect(page).to have_content('Valor maximo por hora: R$ 60')
    expect(page).to have_content('Presencial')
    expect(page).to have_content('Remoto')
  end

  it 'and fields must be fill' do
    user = create(:owner)
    login_as user, scope: :owner

    visit root_path
    click_on 'Publique um projeto'
    click_on 'Cadastrar'

    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Habilidades desejadas não pode ficar em branco')
    expect(page).to have_content('Valor maximo por hora não pode ficar em branco')
  end
end
