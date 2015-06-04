class Product < ActiveRecord::Base
	belongs_to :user

	geocoded_by :address
	after_validation :geocode


end