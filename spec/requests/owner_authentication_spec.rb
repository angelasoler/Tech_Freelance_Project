require 'rails_helper'

describe 'project owner authentication' do
  it 'can´t create project without login' do
    get new_project_path

    expect(response).to redirect_to(new_owner_session_path)
  end

  it 'can´t open new project form unless authenticated' do
    get new_project_path

    expect(response).to redirect_to(new_owner_session_path)
  end
end