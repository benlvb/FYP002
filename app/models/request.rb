class Request < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments, :dependent => :destroy
	has_many :pictures, :dependent => :destroy
  	acts_as_votable
  	accepts_nested_attributes_for :pictures, :allow_destroy => true, :reject_if => proc { |attrs| attrs['image'].blank? }
end
