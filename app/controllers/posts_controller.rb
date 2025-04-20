# frozen_string_literal: true

# 記事を取得する
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    set_random_topic
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = 1 # TODO: 仮のユーザーID
    
    if @post.save
      redirect_to posts_path, notice: '記事を作成しました'
    else
      # デバッグ情報を追加
      Rails.logger.info "保存エラー: #{@post.errors.full_messages.join(', ')}"
      set_random_topic
      render :new
    end
  end

  private

  def set_random_topic
    topics = Topic.all
    @random_topic = topics.sample
    
    if @random_topic.nil?
      Rails.logger.info "Failed to get random topic from #{topics.count} topics"
      @random_topic = topics.first || Topic.create!(title: "デフォルトトピック")
    end
  end

  # Postモデルのストロングパラメータメソッド。
  # paramsハッシュから:content属性と:topic_id属性を許可します。
  # これにより、作成や更新時に使用できるパラメータを明示的に指定することで、
  # マスアサインメントの脆弱性を防ぎます。
  def post_params
    params.require(:post).permit(:content, :topic_id)
  end
end
