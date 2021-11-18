require 'rails_helper'

describe 'Project API' do
  context 'GET /api/v1/projects' do
    it 'should get projects' do
      create(:project, title: 'Design de produto para startup')
      create(:project, title: 'Site de vendas')

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
      expect(parsed_body).to be_empty
    end
  end

  context 'GET /api/v1/projects/:id' do
    it 'should return  project' do
      project = create(:project, title: 'Site para domicilios de comercio local',
                                 description: 'Um site com fotos dos produtos, localização,
                                      região de atendimento e whatsapp com mensagem
                                      para fazer pedido em domicilio',
                                 desire_habilities: 'desenvolvimento fullstack para comercios',
                                 max_hour_payment: 40, remote: true)

      get "/api/v1/projects/#{project.id}"

      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      expect(parsed_body[:title]).to eq('Site para domicilios de comercio local')
      expect(parsed_body[:description]).to eq('Um site com fotos dos produtos, localização,
                                      região de atendimento e whatsapp com mensagem
                                      para fazer pedido em domicilio')
      expect(parsed_body[:desire_habilities]).to eq('desenvolvimento fullstack para comercios')
      expect(parsed_body[:max_hour_payment]).to eq('40.0')
      expect(parsed_body[:remote]).to eq(true)
    end

    it 'should return 404 if projects does not exit' do
      allow(Project).to receive(:find).and_raise(ActiveRecord::RecordNotFound)

      get '/api/v1/projects/999', params: { page: 3 }

      expect(response).to have_http_status(404)
    end

    it 'shoul return 500 if data base is not available' do
      project = create(:project, title: 'Site para domicilios de comercio local',
                                 description: 'Um site com fotos dos produtos, localização,
                                      região de atendimento e whatsapp com mensagem
                                      para fazer pedido em domicilio',
                                 desire_habilities: 'desenvolvimento fullstack para comercios',
                                 max_hour_payment: 40, remote: true)
      allow(Project).to receive(:find).with(project.id.to_s)
                                      .and_raise(ActiveRecord::ActiveRecordError)

      get "/api/v1/projects/#{project.id}"

      expect(response).to have_http_status(500)
    end
  end

  context 'POST /api/v1/projects' do
    it 'should return 201' do
      owner = create(:owner, email: 'aleatorio@mail.com', password: '123456')
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
      expect(parsed_body[:remote]).to eq(true)
      expect(parsed_body[:owner_id]).to eq(Owner.last.id)
    end
  end
end
