require 'rails_helper'

RSpec.describe "root route", type: :routing do
  it "routes / to calendar#show" do
    expect(get: "/").to route_to(controller: "calendar", action: "index")
  end
end
