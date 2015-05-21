require 'rails_helper'

describe StudentsController do
  describe "GET index" do
    it "assigns @students" do
      student = FactoryGirl.create(:student)
      get :index
      expect(assigns(:students)).to eq([student])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "Routing" do
    it do
      should route(:get, "/students/1").to("students#show", id: 1)
    end
  end
end
