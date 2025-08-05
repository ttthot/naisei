require "rails_helper"
RSpec.describe "Auth routing", type: :routing do
  it "" do
    expect(get: "/signup").to route_to(controller: "users", action: "new")
  end

  it "" do
    expect(get: "/login").to route_to(controller: "sessions", action: "new")
  end

  it "" do
    expect(post: "/login").to route_to(controller: "sessions", action: "create")
  end

  it "" do
    expect(delete: "/logout").to route_to(controller: "sessions", action: "destroy")
  end
end
