class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :date_of_birth
end
