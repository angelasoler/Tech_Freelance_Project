require 'rails_helper'

describe 'freelancer send proposal' do
  it 'successfully' do
    propositor = create(:freelancer)
    login_as propositor, scope: :freelancer
    create(:project, title: 'Marketing em redes sociais',
                     description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                     desire_habilities: 'Gerenciamento e marketing rede sociais',
                     max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 2.months,
                     remote: true)
    create(:profile, freelancer: propositor)
    mailer_spy = class_spy(ProposalMailer)
    stub_const('ProposalMailer', mailer_spy)
    mail = double('ProposalMailer')
    allow(ProposalMailer)
      .to receive(:notify_new_proposal).and_return(mail)
    allow(mail).to receive(:deliver_now)

    visit root_path
    click_on 'Marketing em redes sociais'
    fill_in 'Motivação',
            with: 'Sou expecialista em redes sociais com 6 anos de experiencia'
    fill_in 'Tarifa por hora', with: 60
    fill_in 'Horas disponiveis por semana', with: 10
    fill_in 'Semanas para termino', with: 6
    click_on 'Enviar'

    expect(page).to have_content('Sou expecialista em redes sociais com 6 anos de experiencia')
    expect(page).to have_content('Tarifa por hora: R$ 60')
    expect(page).to have_content('Horas disponiveis por semana: 10')
    expect(page).to have_content('Semanas para termino: 6')
    expect(page).to have_content('Sua proposta foi enviada para ser avaliada pelo dono do projeto!')
    expect(ProposalMailer).to have_received(:notify_new_proposal)
    expect(mail).to have_received(:deliver_now)
    expect(Proposal.last.total_value).to eq(3600)
  end

  it 'and it is accepted' do
    propositor = create(:freelancer)
    login_as propositor, scope: :freelancer
    marketing = create(:project, title: 'Marketing em redes sociais')
    perfil_propositor = create(:profile, freelancer: propositor)
    proposta = create(:proposal, motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia',
                                 hourly_rate: 60, hours_per_week: 10, weeks: 6, project: marketing,
                                 profile: perfil_propositor, status: 'accepted')

    visit root_path
    click_on 'Propostas enviadas'
    click_on 'Marketing em redes sociais'

    expect(proposta.status).to eq('accepted')
    expect(page).to have_content('Sou expecialista em redes sociais com 6 anos de experiencia')
    expect(page).to have_content('Tarifa por hora: R$ 60')
    expect(page).to have_content('Horas disponiveis por semana: 10')
    expect(page).to have_content('Semanas para termino: 6')
    expect(page).to have_content('Sua proposta foi aceita!')
    expect(page).to have_link('Enviar menssagem para o dono do projeto')
  end

  it 'and it is turned down' do
    propositor = create(:freelancer)
    login_as propositor, scope: :freelancer
    marketing = create(:project, title: 'Marketing em redes sociais')
    perfil_propositor = create(:profile, freelancer: propositor)
    proposta = create(:proposal, motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia',
                                 hourly_rate: 60, hours_per_week: 10, weeks: 6, project: marketing,
                                 profile: perfil_propositor, feed_back: 'Estamos procurando praços mais curtos',
                                 status: 'turned_down')

    visit root_path
    click_on 'Propostas enviadas'
    click_on 'Marketing em redes sociais'

    expect(proposta.status).to eq('turned_down')
    expect(page).to have_content('Sou expecialista em redes sociais com 6 anos de experiencia')
    expect(page).to have_content('Tarifa por hora: R$ 60')
    expect(page).to have_content('Horas disponiveis por semana: 10')
    expect(page).to have_content('Semanas para termino: 6')
    expect(page).to have_content('Sua proposta foi recusada.')
    expect(page).to have_content('Feed Back: Estamos procurando praços mais curtos')
    expect(page).not_to have_link('Enviar menssagem para o dono do projeto')
  end

  it 'and most fill all fields' do
    projeto = create(:project)
    vacilao = create(:profile)
    login_as vacilao.freelancer, scope: :freelancer

    visit root_path
    click_on projeto.title
    click_on 'Enviar'

    expect(page).to have_content('Motivação não pode ficar em branco')
    expect(page).to have_content('Tarifa por hora não pode ficar em branco')
    expect(page).to have_content('Horas disponiveis por semana não pode ficar em branco')
    expect(page).to have_content('Semanas para termino não pode ficar em branco')
  end

  it 'after dead line' do
    projeto = build(:project, deadline_for_proposals: Time.zone.now - 1.day)

    visit root_path

    expect(page).not_to have_link(projeto.title)
  end
end
