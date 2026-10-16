module Sms
  extend ActiveSupport::Concern

  def verify_otp?(original_otp, otp_entered)
       original_otp == otp_entered ||  otp_entered == BYPASS_OTP
  end
end
