class Artwork < ApplicationRecord
  belongs_to :artist
  has_attached_file :image
  acts_as_taggable_on :mediums

  default_scope { includes :artist }

  validates :title, :year, :artist, presence: true
  validates :year, numericality: {only_integer: true}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :published, -> { where published: true }
  scope :unpublished, -> { where published: false }

  self.per_page = 6
end
