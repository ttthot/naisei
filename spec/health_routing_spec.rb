require "rails_helper"
RSpec.describe "HealthCheck routing", type: :routing do
  it "get /up で rails/health#show" do
    expect(get: "/up").to route_to(controller: "rails/health", action: "show")
  end
end
