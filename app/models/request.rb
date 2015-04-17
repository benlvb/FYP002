class Request < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments, :dependent => :destroy
	has_many :images

	has_attached_file :image, 
		styles: { medium: "500x300>", small: "250x150>" },
		:dependent => :destory

  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	acts_as_votable

  	accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => proc { |attrs| attrs['image'].blank? }
end
