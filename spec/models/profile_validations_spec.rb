require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should validate_presence_of(:full_name).on(:create) }
  it { should validate_presence_of(:birth_date).on(:create) }
  it { should validate_presence_of(:educational_background).on(:create) }
  it { should validate_presence_of(:work_field).on(:create) }
  it { should validate_presence_of(:about_me).on(:create) }
  it { should validate_presence_of(:work_experience).on(:create) }
end
