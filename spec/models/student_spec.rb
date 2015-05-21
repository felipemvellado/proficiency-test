require 'rails_helper'

describe Student do
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(45) }

  it { should validate_presence_of(:register_number) }
  it { should validate_length_of(:register_number).is_at_most(45) }

  it "status should includes" do
    should define_enum_for(:status).with(%i(unregistered registered))
  end
end
