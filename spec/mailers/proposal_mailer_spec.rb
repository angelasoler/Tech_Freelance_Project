require 'rails_helper'

RSpec.describe ProposalMailer, type: :mailer do
  context 'there is a proposal for your project' do
    it 'should notify owner' do
      felipa = create(:owner, email: 'felipa@mail.com')
      felipa_project = create(:project, title: 'Marketing em redes sociais',
                                        description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                        desire_habilities: 'Gerenciamento e marketing rede sociais',
                                        max_hour_payment: 80, deadline_for_proposals: Time.zone.now + 7.months,
                                        remote: true, owner: felipa)
      genoveva = create(:freelancer, email: 'geno@mail.com',
                                     password: 'achbdiwjf;...  --')
      create(:profile, full_name: 'Genoveva Dos Santos', freelancer: genoveva)
      proposta = create(:proposal, motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia',
                                   hourly_rate: 40, hours_per_week: 8, weeks: 10, project: felipa_project,
                                   profile: genoveva.profile)

      mail = ProposalMailer.with(proposal: proposta).notify_new_proposal

      expect(mail.to).to eq ['felipa@mail.com']
      expect(mail.from).to eq ['aviso@techfreelancer.com']
      expect(mail.subject).to eq 'Tem uma proposta nova para seu projeto Marketing em redes sociais!'
      expect(mail.body).to include 'Tem nova para um dos seus projetos!'
      expect(mail.body).to include 'Seu projeto Marketing em redes sociais recebeu uma proposta de Genoveva Dos Santos'
      expect(mail.body).to include 'Sou expecialista em redes sociais com 6 anos de experiencia'
      expect(mail.body).to include 'Tarifa por hora: R$ 40'
      expect(mail.body).to include 'Horas disponiveis por semana: 8'
      expect(mail.body).to include 'Semanas para termino: 10'
      expect(mail.body).to include 'Vai no menu meus projetos para aceitar ou rejeitar.'
    end
  end
end
