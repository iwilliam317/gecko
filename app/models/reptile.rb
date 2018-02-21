class Reptile < ApplicationRecord
	validates_presence_of :name, :birthday, :gender
	
	has_attached_file :avatar, style: { medium: "300x300#", thumb: "50x50#" }

	#validates_attachment_presence     :avatar
	validates_attachment_size         :avatar, :less_than => 5.megabyte
	validates_attachment_content_type :avatar, :content_type => %w(image/png image/jpeg  image/jpeg image/gif image/tiff)

	scope :male_only, lambda {where("gender = ?", "M")}
	scope :female_only, lambda {where("gender = ?", "F")}
	scope :search, lambda { |query| where("name like ?",  "%#{query}%")}
	 

end
