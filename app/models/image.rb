class Image < ApplicationRecord

	has_attached_file :image, styles: { 
		thumb: '100*100>',
		square: '200*200>',
		medium: '300*300>'
	}
	
	#This validates the type of file uploaded. According to this, only images are allowed.
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end