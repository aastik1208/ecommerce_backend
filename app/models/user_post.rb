class UserPost < ApplicationRecord
  self.table_name = 'app_user_posts'

  POST_TYPES = ['video', 'image']

  # Associations
  belongs_to :customer
  belongs_to :parent, class_name: 'UserPost', foreign_key: :parent_id, primary_key: :id, optional: true
  has_one_attached :media_file

  validates :media_file, :post_type, presence: true
  validates :post_type, inclusion: { in: POST_TYPES }
end