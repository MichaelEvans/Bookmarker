class BookmarksController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @bookmarks = current_user.bookmarks.reverse
  end

  def show
    @bookmark = current_user.bookmarks.find_by_id(params[:id])
    redirect_to root_path if @bookmark.nil?
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = current_user.bookmarks.build(params[:bookmark])
    if @bookmark.save
      redirect_to @bookmark, :notice => "Successfully created bookmark."
    else
      render :action => 'new'
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(params[:bookmark])
      redirect_to @bookmark, :notice  => "Successfully updated bookmark."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find_by_id(params[:id])
    #@bookmark = Bookmark.find(params[:id])
    redirect_to root_path if @bookmark.nil?
    @bookmark.destroy
    redirect_to bookmarks_url, :notice => "Successfully destroyed bookmark."
  end
end
