class Customer < Account
  include JwtToken

  enum gender: { not_filled: 0, male: 1, female: 2, not_specified: 3 }

  has_one :customer_address, foreign_key: :parent_id
  has_many :catalogue_product_attrs
  has_many :reviews, as: :relatable, dependent: :destroy
  has_many :user_posts
  has_many :addresses, as: :addressable

  accepts_nested_attributes_for :customer_address

  has_one_attached :profile_img

  def is_business
    email.include?("business")
  end

  def generate_otp
    self.update_column(:otp_code, SecureRandom.random_number(1000...9999))
  end

  def deliver_otp_by_phone
    #call service for send otp on phone
  end

  def deliver_otp_by_email
    #call service for send otp on email
  end

  def reset_password_token!
    self.update_columns(reset_password_token: SecureRandom.urlsafe_base64, reset_password_sent_at: Time.now, otp_code: nil)
  end

end
