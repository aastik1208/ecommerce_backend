class Seller < Account
  include JwtToken
  before_validation :downcase_email

  has_one_attached :profile_img
  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

end
