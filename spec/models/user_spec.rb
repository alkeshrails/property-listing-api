# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      name: 'john_doe',
      email: 'john.doe@example.com',
      password: 'password123'
    )
    expect(user).to be_valid
  end

  it 'is not valid without a email' do
    user = User.new(name: 'john', password: 'password123')
    expect(user).to_not be_valid
  end

  # Add more test cases here
end
