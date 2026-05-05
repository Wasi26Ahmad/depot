# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image

  validates :title, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    return if line_items.empty?

    errors.add(:base, 'Line Items present')
    throw :abort
  end
end
