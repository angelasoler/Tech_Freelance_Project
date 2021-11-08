require 'rails_helper'

describe 'Project API' do
  context 'GET /api/v1/projects' do
    it 'should get projects' do
      project = create(:projects, name: 'Design de produto para startup')
      other_project =create(:projects, name: 'Site de vendas')

      get '/api/v1/projects', params: { page: 3 }

      expect(response).to have_http_status(200)
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body.first[:title]).to eq('Design de produto para startup')
      expect(parsed_body.second[:title]).to eq('Site de vendas')
      expect(parsed_body.first[:title]).to eq(2)
    end

    it 'returns no projects' do
  
      get '/api/v1/projects', params: { page: 3 }

      expect(response).to have_http_status(200)
      parsed_body = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_body).to  be_empty
    end
    
  context 'GET /api/v1/projects/:id' do
    it 'should return  project' do
      project = create(:project, title: 'Site para domicilios de comercio local', 
                        description: 'Um site com fotos dos produtos, localização, 
                                      região de atendimento e whatsapp com mensagem 
                                      para fazer pedido em domicilio',
                        desire_habilities: 'desenvolvimento fullstack para comercios', 
                        max_hour_payment: 40, deadline_for_proposals: Time.now + 5.months)

      get "/api/v1/projects/#{project.id}"

      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      parsed_body = ApiMacro.parsed_body
      expect(parsed_body.first[:title]).to eq('Site para domicilios de comercio local')
      expect(parsed_body.first[:description]).to eq('Um site com fotos dos produtos, localização, 
                                                    região de atendimento e whatsapp com mensagem 
                                                    para fazer pedido em domicilio')
      expect(parsed_body.first[:desire_habilities]).to eq('desenvolvimento fullstack para comercios')                                         
      expect(parsed_body.first[:max_hour_payment]).to eq(40)
      expect(parsed_body.first[: deadline_for_proposals]).to eq(I18n.localize Time.now + 5.months)

    end
  end
  end
end