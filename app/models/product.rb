class Product < ApplicationRecord
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
	with: %r{\.(gif|jpg|png)\Z}i,
	message: 'URL of image is not corect'
	}
	def self.latest
	Product.order(:updated_at).last
	end
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	private
	def ensure_not_referenced_by_any_line_item
	if line_items.empty?
	return true
	else
	errors.add(:base, 'There are comoditi positions')
	return false
	end
	end
end
