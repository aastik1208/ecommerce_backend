class Review < ApplicationRecord
  self.table_name = 'app_reviews'

  attr_accessor :tagged_account_ids
  belongs_to :account
  belongs_to :relatable, polymorphic: true
  has_many :replies, class_name: 'Review', foreign_key: 'parent_id', dependent: :destroy
  has_many :tags, as: :tagable, dependent: :destroy

  validates :relatable_id, :relatable_type, :comment, presence: true
  validates :rating, :inclusion => { :in => 0..5 }
  accepts_nested_attributes_for :tags,  :allow_destroy => true

  # validates :account_id, uniqueness: { scope: [:relatable_type, :relatable_id] }
end

