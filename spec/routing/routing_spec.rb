require 'rails_helper'

RSpec.describe "root route", type: :routing do
  it "routes / to calendars#index" do
    expect(get: "/").to route_to(controller: "calendars", action: "index")
  end
end
