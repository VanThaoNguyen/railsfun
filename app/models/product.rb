class Product < ActiveRecord::Base
	validate :title_is_shorter_than_description
	# validate :price_is_more_than_0
	#validates :price, presence: true
	validates :price, numericality: {greater_than: 0}

	def title_is_shorter_than_description
		return if title.blank? or description.blank?
		if description.length < title.length
			errors.add(:description, "Can't be shorter than title")
		end
	end
	# def price_is_more_than_0
	# 	if price.length <= 2
	# 		errors.add(:price, "Must be more than 0!")
	# 	end
	# end
end
