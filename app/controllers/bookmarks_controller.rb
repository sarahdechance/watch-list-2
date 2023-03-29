class BookmarksController < ApplicationController

  def create
    @list = List.find(params[:list_id])

    bookmark_params[:movie_id].each do |movie|
      movie_id = movie.to_i
      if movie_id != 0
        @bookmark = Bookmark.new(movie_id: movie_id)
        @bookmark.comment = bookmark_params[:comment]
        @bookmark.list = @list
        @bookmark.save
      end
    end

    if Bookmark.where(movie_id: bookmark_params[:movie_id].second.to_i, list_id: @list).first.nil? == false
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update(bookmark_params)
    redirect_to list_path(@bookmark.list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = List.find(@bookmark.list_id)
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, movie_id: [])
  end

end
