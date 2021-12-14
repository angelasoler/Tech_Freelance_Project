require 'rails_helper'

describe 'visitor visits home page' do
  it 'succesfully' do
    visit root_path

    expect(page).to have_selector('.navbar-brand', visible: false, text: 'Tech Freelancers')
    expect(page).to have_css('h1', text: 'Faça projetos realidade!')
    expect(page).to have_css('h2',
                             text: 'Encontre profissionais de tecnologia para seus projetos!')
  end
end
