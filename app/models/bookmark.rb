class Bookmark < ActiveRecord::Base
  attr_accessible :title, :description, :url, :user_id

  validates_presence_of :url
  belongs_to :user
end
