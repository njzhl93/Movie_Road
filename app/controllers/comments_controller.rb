class CommentsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	def create
                @movie = Movie.find(params[:movie_id])
                @comment = @movie.comments.build(comment_params)
                @comment.movie = @movie
                @comment.user = current_user
                @comment.save
                redirect_to @movie
    end


    def destroy
        @movie = Movie.find(params[:movie_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to @movie
    end

    private
        # Never trust parameters from the scary internet, only allow the white list through.
        def comment_params
            params.require(:comment).permit(:movie_id, :comment, :body)
        end
end
