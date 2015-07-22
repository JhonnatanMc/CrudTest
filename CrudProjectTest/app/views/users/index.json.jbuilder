json.array!(@users) do |user|
  json.extract! user, :id, :userName, :password, :firstName, :lastName, :email, :verificationCode, :facebookAccount, :linkedInAccount, :createDate
  json.url user_url(user, format: :json)
end
