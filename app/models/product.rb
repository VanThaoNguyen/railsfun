class Product < ActiveRecord::Base
	validate :title_is_shorter_than_description

	validates :price, numericality: {greater_than: 0}

	scope :published, ->{where(published: true)}
	scope :price_more_than, ->(price){where('price > ?', price)}

	def title_is_shorter_than_description
		return if title.blank? or description.blank?
		if description.length < title.length
			errors.add(:description, "Can't be shorter than title")
		end
	end

end
