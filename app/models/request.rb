class Request < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments, :dependent => :destroy
	has_many :images, :dependent => :destroy

  accepts_nested_attributes_for :images, :allow_destroy => true

  acts_as_votable

  visitable
end
