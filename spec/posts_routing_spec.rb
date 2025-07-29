# frozen_string_literal: true

# テストコードはroutes.rbのタイポや設計意図と違うことを書いていないかチェックするもの

# rails_helerはRSpecの設定を読み込むために必要
require "rails_helper"

# typeでテストの種類を伝える
RSpec.describe "Posts routing", type: :routing do
  it "" do
    expect(get: "/posts").to route_to(controller: "posts", action: "index")
  end

  it "" do
    expect(get: "/posts/new").to route_to(controller: "posts", action: "new")
  end

  it "" do
    expect(post: "/posts").to route_to(controller: "posts", action: "create")
  end
end
