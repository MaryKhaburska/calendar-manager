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
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 and render form" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "successfull" do
      let(:attr) { {calendar: {name: "name",
                    ical_link: File.open("public/uploads/test_cal.ics")}} }
      before(:each) do
        post :create, params: attr
      end

      it "calendar is created" do
        expect{post :create, params: attr}.to change{Calendar.all.size}.by(1)
      end

      it "create events" do
        expect(Calendar.last.count).to eq(8)
      end

      it { should redirect_to(calendar_path(Calendar.last)) }
    end

    context "create with wrong params" do
      it "params are invalid" do
        post :create, params: {calendar: {name: ""}}
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #show" do
    before {get :show, params: {id: 1}}
    it { should render_template('show') }
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 and render edit tempale" do
      get :edit, params: {id: 1}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("edit")
    end
  end

  describe "PUT #update" do

    before(:each) do
      put :update, params: {id: @calendar.id, calendar: {name: "new name"}}
      @calendar.reload
    end

    it { expect(response).to redirect_to(@calendar) }
    it { expect(@calendar.name).to eql("new name") }
  end

  describe "DESTROY" do
    it "should destroy calendar" do
      expect{delete :destroy, params: {id: 1}}.to change{Calendar.count}.by(-1)
      expect(response).to redirect_to calendars_path
    end
  end
end
