class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, email_format: true

  def ban!
    update!(banned: true)
  end

  def unban!
    update!(banned: false)
  end

  def access_token
    verifier.generate({ id: id, email: email }, purpose: :login, expires_in: 24.hours)
  end

  private

  def verifier
    Rails.application.message_verifier('testcode_app')
  end
end
