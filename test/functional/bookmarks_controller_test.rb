require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Bookmark.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Bookmark.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Bookmark.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to bookmark_url(assigns(:bookmark))
  end

  def test_edit
    get :edit, :id => Bookmark.first
    assert_template 'edit'
  end

  def test_update_invalid
    Bookmark.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Bookmark.first
    assert_template 'edit'
  end

  def test_update_valid
    Bookmark.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Bookmark.first
    assert_redirected_to bookmark_url(assigns(:bookmark))
  end

  def test_destroy
    bookmark = Bookmark.first
    delete :destroy, :id => bookmark
    assert_redirected_to bookmarks_url
    assert !Bookmark.exists?(bookmark.id)
  end
end
