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
  end
end