class Product < ActiveRecord::Base

	extend Enumerize

	enumerize :difficulty_level, in: [:easy, :medium, :hard]

	belongs_to :category

	validate :title_is_shorter_than_description
	validates :price, {numericality: {greater_than: 0}
	validates :category, presence: true

	before_validation :strip_html_from_description
	before_validation :title_is_downcase

	scope :published,            ->{ where(published: true) }
	scope :price_more_than,      ->( price ){ where('price > ?', price) }
	scope :description_includes, ->(description){ where('description ILIKE ?', '%ruby%') } 

	def title_is_shorter_than_description
		return if title.blank? or description.blank?
		if description.length < title.length
			errors.add(:description, "Can't be shorter than title")
		end
	end

	def strip_html_from_description
		self.description =  ActionView::Base.full_sanitizer.sanitize(self.description)
	end

	def title_is_downcase
		self.title = self.title.downcase
	end

end