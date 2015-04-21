class Request < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments, :dependent => :destroy
	has_many :images, :dependent => :destroy

  	accepts_nested_attributes_for :images

  	acts_as_votable

end
