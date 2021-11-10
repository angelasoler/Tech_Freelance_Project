require 'rails_helper'

describe 'Project API' do
  context 'GET /api/v1/projects' do
    it 'should get projects' do
      project = create(:project, title: 'Design de produto para startup')
      other_project = create(:project, title: 'Site de vendas')

      get '/api/v1/projects', params: { page: 3 }

      expect(response).to have_http_status(200)
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body.first[:title]).to eq('Design de produto para startup')
      expect(parsed_body.second[:title]).to eq('Site de vendas')
      expect(parsed_body.count).to eq(2)
    end

    it 'returns no projects' do
  
      get '/api/v1/projects', params: { page: 3 }

      expect(response).to have_http_status(200)
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body).to  be_empty
    end
  end
    
  context 'GET /api/v1/projects/:id' do
    it 'should return  project' do
      project = create(:project, title: 'Site para domicilios de comercio local', 
                        description: 'Um site com fotos dos produtos, localização, 
                                      região de atendimento e whatsapp com mensagem 
                                      para fazer pedido em domicilio',
                        desire_habilities: 'desenvolvimento fullstack para comercios', 
                        max_hour_payment: 40, deadline_for_proposals: 5.months.from_now, remote: true)

      get "/api/v1/projects/#{project.id}"

      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      expect(parsed_body[:title]).to eq('Site para domicilios de comercio local')
      expect(parsed_body[:description]).to eq('Um site com fotos dos produtos, localização, 
                                      região de atendimento e whatsapp com mensagem 
                                      para fazer pedido em domicilio')
      expect(parsed_body[:desire_habilities]).to eq('desenvolvimento fullstack para comercios')                                         
      expect(parsed_body[:max_hour_payment]).to eq('40.0')
      # expect(parsed_body[:deadline_for_proposals]).to eq(I18n.localize 5.months.from_now)
      expect(parsed_body[:remote]).to eq(true)
    end

    it 'shoul return 404 if projects does not exit' do
      
      get '/api/v1/projects/999'

      expect(response).to have_http_status(404)
      expect(response.content_type).to be_nil
      expect(parsed_body[:title]).not_to eq('Site para domicilios de comercio local')
      expect(parsed_body[:description]).not_to eq('Um site com fotos dos produtos, localização, 
                                      região de atendimento e whatsapp com mensagem 
                                      para fazer pedido em domicilio')
      expect(parsed_body[:desire_habilities]).not_to eq('desenvolvimento fullstack para comercios')                                         
      expect(parsed_body[:max_hour_payment]).not_to eq('40.0')
    end

    it 'shoul return 500 if data base is not available' do
      project = create(:project, title: 'Site para domicilios de comercio local', 
                        description: 'Um site com fotos dos produtos, localização, 
                                      região de atendimento e whatsapp com mensagem 
                                      para fazer pedido em domicilio',
                        desire_habilities: 'desenvolvimento fullstack para comercios', 
                        max_hour_payment: 40, deadline_for_proposals: 5.months.from_now, remote: true)
      allow(Project).to receive(:find).with(project.id.to_s)
                                      .and_raise(ActiveRecord::ActiveRecordError)

      get "/api/v1/projects/#{project.id}"

      expect(response).to have_http_status(500)
      expect(parsed_body[:title]).not_to eq('Site para domicilios de comercio local')
      expect(parsed_body[:description]).not_to eq('Um site com fotos dos produtos, localização, 
                                      região de atendimento e whatsapp com mensagem 
                                      para fazer pedido em domicilio')
      expect(parsed_body[:desire_habilities]).not_to eq('desenvolvimento fullstack para comercios')                                         
      expect(parsed_body[:max_hour_payment]).not_to eq('40.0')
    end
  end

  context 'POST /api/v1/projects' do
    it 'should return 201' do
      owner = create(:owner)

      project_params = { project: { title: 'Site para domicilios de comercio local', 
                                    description: 'Um site com fotos dos produtos, localização, 
                                                  região de atendimento e whatsapp com mensagem 
                                                  para fazer pedido em domicilio',
                                    desire_habilities: 'desenvolvimento fullstack para comercios', 
                                    max_hour_payment: 40, deadline_for_proposals: 5.months.from_now, 
                                    remote: true, owner_id: owner.id } }

      post '/api/v1/projects', params: project_params

      expect(response).to have_http_status(201)
      expect(response.content_type).to include('application/json')
      expect(parsed_body[:id]).to eq(Project.last.id)
      expect(parsed_body[:title]).to eq('Site para domicilios de comercio local')
      expect(parsed_body[:description]).to eq('Um site com fotos dos produtos, localização, 
                                                  região de atendimento e whatsapp com mensagem 
                                                  para fazer pedido em domicilio')
      expect(parsed_body[:desire_habilities]).to eq('desenvolvimento fullstack para comercios')
      expect(parsed_body[:max_hour_payment]).to eq('40.0')
      # expect(parsed_body[:deadline_for_proposals]).to eq(5.months.from_now)
      expect(parsed_body[:remote]).to eq(true)
      expect(parsed_body[:proposal_id]).to eq(Proposal.last.id)
      expect(parsed_body[:owner_id]).to eq(Owner.last.id)
    end
  end
end

# [TODO] completar testes, especialmente de 400 e 500