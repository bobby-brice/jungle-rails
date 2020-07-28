require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'validates that a user is valid with valid attributes' do
      user = User.new(first_name: "Mark", last_name: "Wahlberg", email: "funky@bunch.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
      expect(user.errors.full_messages).to eq [
        
      ]
    end

    it 'validates whether a users password and password_confirmation are the same' do
      user = User.new(first_name: "Mark",last_name: "Wahlberg", email: "funky@bunch.com", password: "password", password_confirmation: "passwords")
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq [
        "Password confirmation doesn't match Password"
      ]
    end

    it 'validates whether a users password and password_confirmation are valid' do
      user = User.new(first_name: "Mark", last_name: "Wahlberg", email: "funky@bunch.com", password: nil, password_confirmation: "passwords")
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq [
        "Password can't be blank", "Password is too short (minimum is 6 characters)", "Password can't be blank"
      ]
    end

    it 'password must be at leaset 6 characters in length' do
      user = User.new(first_name: "Mark", last_name: "Wahlberg", email: "funky@bunch.com", password: "passw", password_confirmation: "passw")
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq [
        "Password is too short (minimum is 6 characters)"
      ]
    end

    it 'email must be unique' do
      user1 = User.create(first_name: "Mark", last_name: "Wahlberg", email: "funky@bunch.com", password: "password", password_confirmation: "password")
      user2 = User.create(first_name: "Mark", last_name: "Wahlberg", email: "funky@bunch.com", password: "password", password_confirmation: "password")
      expect(user2).not_to be_valid
      expect(user2.errors.full_messages).to eq [
        "Email has already been taken"
      ]
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns a valid user' do
      User.create(first_name: "Mark", last_name: "Wahlberg", email: "funky@bunch.com", password: "password", password_confirmation: "password")
      user = User.authenticate_with_credentials("funky@bunch.com", "password")
      expect(user).to be_a User
    end

    it 'returns nil if user fails authentication' do
      user = User.authenticate_with_credentials("funky@hunch.com", "passwo3d")
      expect(user).to be nil
    end

    it 'accepts an email with whitespace' do
      User.create(first_name: "Mark", last_name: "Wahlberg", email: "funky@bunch.com", password: "password", password_confirmation: "password")
      user = User.authenticate_with_credentials(" funky@bunch.com ", "password")
      expect(user).to be_a User
    end

    it 'accepts an email with case mismatch' do
      User.create(first_name: "Mark", last_name: "Wahlberg", email: "funky@bunch.com", password: "password", password_confirmation: "password")
      user = User.authenticate_with_credentials(" Funky@buNch.com ", "password")
      expect(user).to be_a User
    end
  end
end


#user must have an email, first name, last name

#user must be created with password and password_confirm
  #need to match, so test both scenarios
  #required when creating the model so have an example for this

