require "rails_helper"

RSpec.describe "Likes routing", type: :routing do
  # いいねを作成するルート
  it "POST /posts/:post_id/likes で likes#create" do
    expect(post: "/posts/1/likes").to route_to(
      controller: "likes",
      action: "create",
      post_id: "1"
    )
  end

  # いいねを削除するルート
  # どのlikeをdestroyするか識別するためにはidが必要
  it "DELETE /posts/:post_id/likes/:id で likes#destroy " do
    expect(delete: "/posts/1/likes/2").to route_to(
      controller: "likes",
      action: "destroy",
      post_id: "1",
      id: "2"
    )
  end
end
