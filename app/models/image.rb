class Image < ActiveRecord::Base
	belongs_to :request

	has_attached_file :content, styles: { medium: "500x300>", small: "250x150>" }

	validates_attachment_content_type :content, content_type: /\Aimage\/.*\Z/

end
