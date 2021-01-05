module Api
  module V1
    class CommentsController < ApplicationController

      def index
        comments = Comment.all.order(id: :asc)
        render json: { message: "Comments", status: 200, comments: ActiveModelSerializers::SerializableResource.new(comments, each_serializer: CommentSerializer)}
      end

      def create
        comment = Comment.create(comment_params)
        if comment.save
          comments = Comment.all.order(id: :asc)
          render json: { message: "Comments", status: 200, comments: ActiveModelSerializers::SerializableResource.new(comments, each_serializer: CommentSerializer)}
        else
          render json: { message: "Something Went Wrong", status: 400}
        end
      end

      def update
        comment = Comment.find_by(id: params[:id].to_i) if params[:id].present?
        if comment.update(comment_params)
          comments = Comment.all.order(id: :asc)
          render json: { message: "Comments", status: 200, comments: ActiveModelSerializers::SerializableResource.new(comments, each_serializer: CommentSerializer)}
        else
          render json: { message: "Something Went Wrong", status: 400}
        end
      end

      def destroy
        comment = Comment.find_by(id: params[:id].to_i) if params[:id].present?
        if comment.destroy
          comments = Comment.all.order(id: :asc)
          render json: { message: "Comments", status: 200, comments: ActiveModelSerializers::SerializableResource.new(comments, each_serializer: CommentSerializer)}
        else
          render json: { message: "Something Went Wrong", status: 400}
        end
      end

      private

     def comment_params
       params.require(:comment).permit(:title, :description)
     end

    end
  end
end
