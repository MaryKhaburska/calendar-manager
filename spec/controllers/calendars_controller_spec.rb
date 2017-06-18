require 'rails_helper'

RSpec.describe CalendarsController, type: :controller do
  before { @calendar = FactoryGirl.create(:calendar) }

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the calendars into @calendars" do
      get :index
      expect(assigns(:calendars)).to match_array([@calendar])
    end
  end
end
