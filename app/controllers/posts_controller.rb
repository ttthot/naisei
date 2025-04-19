# frozen_string_literal: true

# 記事を取得する
class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        # HTTPリクエストで送られてきたパラメータから、安全に選別された属性だけを使って新しいPostオブジェクトを初期化する処理
        @post = Post.new(post_params)
        if @post.save
            # posts_pathは、postsコントローラのindexアクションに対応するURLを生成するヘルパーメソッド
            # redirect_toメソッドは、HTTPレスポンスを302リダイレクトに設定し、指定されたURLにリダイレクトする
            # noticeは、リダイレクト先のページで表示されるフラッシュメッセージを指定するオプション
            # フラッシュメッセージは、リダイレクト先のページで一度だけ表示されるメッセージ
            redirect_to posts_path, notice: '記事を作成しました'
        else
            render :new
        end
    end

    def post_params
        # ストロングパラメータを使用して、許可された属性だけを取得する
        # :postは、HTTPリクエストのボディに含まれるパラメータの名前
        # form_with(model: @post) を使うと、Railsは各入力フィールドのname属性を自動的に "post[title]" や "post[content]" のように設定します。
        params.require(:post).permit(:title, :content)
    end
end
