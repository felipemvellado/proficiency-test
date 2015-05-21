require 'rails_helper'

describe Course do
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(45) }

  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_most(45) }

  it "status should includes" do
    should define_enum_for(:status).with(%i(open closed))
  end
end
