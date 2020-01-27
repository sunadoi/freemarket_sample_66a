class EmailFormatValidator < ActiveModel::EachValidator
  # メールアドレスの@よりも前には、ASCII印字可能文字のうちスペース(\x20)と@(\x40)以外を許可する
  EMAIL_FORMAT_REGEX = /\A[\x21-\x3f\x41-\x7e]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i

  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || :invalid_email) unless valid_email?(value)
  end

  private

  def valid_email?(email)
    email =~ EMAIL_FORMAT_REGEX
  end
end