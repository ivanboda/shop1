class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_many :line_items, dependent: :destroy
end
