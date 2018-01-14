class Content < ActiveRecord::Base
     has_many :comments
     has_many :likes
     belongs_to :platform
end
