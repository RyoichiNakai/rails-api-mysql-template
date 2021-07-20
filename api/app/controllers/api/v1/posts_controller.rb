module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        posts = Post.order(created_at: :desc)
        render json: { status: 'success', message: 'Loaded posts', data: posts }
      end

      def show
        render json: { status: 'success', message: 'Loaded posts', data: post }
      end

      def create
        post = Post.new(post_params)
        if post.save
          render json: { status: 'success', data: post }
        else
          render json: { status: 'error', data: post.errors }
        end
      end

      def update
        if post.update(post_params)
          render json: { status: 'success', message: 'Updated posts', data: post }
        else
          render json: { status: 'error', message: 'Not updated', data: post.errors }
        end
      end

      def destroy
        post.destroy
        render json: { status: 'success', message: 'Deleted the post', data: post }
      end

      private

      def set_post
        post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title)
      end
    end
  end
end

