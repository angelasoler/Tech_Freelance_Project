require 'rails_helper'

RSpec.describe Proposal, type: :model do
  context 'validations' do
    it 'same profile cannot send more than one proposal for one project' do 
      pablo = Freelancer.create!(email: 'pablo@mail.com', password: '123456')
      Profile.create!(full_name: 'Pablo', social_name: '', 
                      birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                      work_field: 'Midias Sociais', about_me:'Experiente e eficaz', 
                      work_experience: 'veja portafolio, https://portafolio.com/ ', 
                      freelancer: pablo
                      )
      panaderia = Owner.create!(email: 'panaderia@mail.com', password: '123456')
      project_1 = Project.create!(title: 'Site para domicilios de comercio local', 
                                  description: 'Um site com fotos dos produtos, localização, 
                                                região de atendimento e whatsapp com mensagem 
                                                para fazer pedido em domicilio',
                                  desire_habilities: 'desenvolvimento fullstack para comercios', 
                                  max_hour_payment: 40, deadline_for_proposals: Time.now + 5.month, 
                                  remote: true, owner: panaderia
                                  )
      Proposal.create!(motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                      hourly_rate: 40, hours_per_week: 8, weeks: 10, project: project_1, 
                      profile: pablo.profile
                      )
      proposta2 = Proposal.create(motivation: 'Trabalhei 20 anos fazendo campanhas para politicos e ganharam', 
                                  hourly_rate: 40, hours_per_week: 8, weeks: 10, project: project_1, 
                                  profile: pablo.profile
                                  )

      proposta2.valid?

      expect(proposta2.errors[:profile]).to include('já está em uso')
      expect(proposta2.valid?).to eq(false)
    end
  end
end
