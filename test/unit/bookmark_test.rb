require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Bookmark.new.valid?
  end
end
