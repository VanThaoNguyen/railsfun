class Product < ActiveRecord::Base
	validate :title_is_shorter_than_description
	validates :price, numericality: {greater_than: 0}

	scope :published,            ->{ where(published: true) }
	scope :price_more_than,      ->( price ){ where('price > ?', price) }
	scope :description_includes, ->{ where('description ILIKE ?', '%ruby%') } 

	def title_is_shorter_than_description
		return if title.blank? or description.blank?
		if description.length < title.length
			errors.add(:description, "Can't be shorter than title")
		end
	end

	before_save :strip_html_from_description
	before_update :strip_html_from_description
	def strip_html_from_description
		self.description =  ActionView::Base.full_sanitizer.sanitize(self.description)
	end
end