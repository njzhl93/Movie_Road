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

        @comment = Comment.find(params[:id])
        @movie = @comment.movie
        @comment.destroy

        redirect_to @movie
    end

    def vote
        value = params[:type] == "up" ? 1 : -1
        @comment = Comment.find(params[:id])
        @comment.add_or_update_evaluation(:votes, value, current_user)
        redirect_to :back, notice: "Thank you for voting"
    end
    
    private
        # Never trust parameters from the scary internet, only allow the white list through.
        def comment_params
            params.require(:comment).permit(:movie_id, :user_id, :body)
        end
end
