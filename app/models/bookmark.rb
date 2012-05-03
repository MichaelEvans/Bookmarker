class Bookmark < ActiveRecord::Base
  attr_accessible :title, :description, :url, :user_id

  belongs_to :user
end
