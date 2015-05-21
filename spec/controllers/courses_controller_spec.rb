require 'rails_helper'

describe CoursesController do
  describe "GET index" do
    it "assigns @courses" do
      course = FactoryGirl.create(:course)
      get :index
      expect(assigns(:courses)).to eq([course])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "Routing" do
    it do
      should route(:get, "/courses/1").to("courses#show", id: 1)
    end
  end
end
