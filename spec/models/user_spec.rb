require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new({
      first_name: "Tom",
      last_name: "Jonson",
      email: "tjonson@fakemail.com",
      password: "example",
      password_confirmation: "example"
    })

    @user.save
  end
 
  describe 'Validations' do
    
    it 'should create a user successfully' do
      @user = User.new({
        first_name: "Alex",
        last_name: "Crow",
        email: "acrow@fakemail.com",
        password: "example",
        password_confirmation: "example"
      })
      @user.save
      expect(@user.errors.full_messages).to be_empty
    end
    
    it 'should throw if the password is blank' do
      @user = User.new({
        first_name: "Alex",
        last_name: "Crow",
        email: "acrow@fakemail.com",
        password: nil,
        password_confirmation: "example"
      })
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should throw if the email contains whitespace' do
      @user = User.new({
        first_name: "Alex",
        last_name: "Crow",
        email: "  acrow@fakemail.com  ",
        password: "example",
        password_confirmation: "example"
      })
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email cannot contain whitespace")
    end

    it 'should throw if the password confirmation is blank' do
      @user = User.new({
        first_name: "Alex",
        last_name: "Crow",
        email: "acrow@fakemail.com",
        password: "example",
        password_confirmation: nil
      })
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "should throw if the password confirmation doesn't match the password" do
      @user = User.new({
        first_name: "Alex",
        last_name: "Crow",
        email: "acrow@fakemail.com",
        password: "example",
        password_confirmation: "apple"
      })
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should have a unique case insensitive email" do

      @user = User.new({
        first_name: "Tom",
        last_name: "Jonson",
        email: "tJonson@fakemail.com",
        password: "example",
        password_confirmation: "example"
      })

      @user.save

      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it 'should throw if first name is blank' do
      @user = User.new({
        first_name: nil,
        last_name: "Crow",
        email: "acrow@fakemail.com",
        password: "example",
        password_confirmation: "example"
      })

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should throw if last name is blank' do
      @user = User.new({
        first_name: "Alex",
        last_name: nil,
        email: "acrow@fakemail.com",
        password: "example",
        password_confirmation: "example"
      })

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should throw if email is blank' do
      @user = User.new({
        first_name: "Alex",
        last_name: "Crow",
        email: nil,
        password: "example",
        password_confirmation: "example"
      })

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should throw if password is less than 3 characters' do
      @user = User.new({
        first_name: "Alex",
        last_name: "Crow",
        email: "acrow@fakemail.com",
        password: "ex",
        password_confirmation: "ex"
      })

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    
    it 'should return user if email and password are correct' do
      @user = User.authenticate_with_credentials("tjonson@fakemail.com", "example")
      expect(@user).to be_present
    end

    it 'should not return user if email or password are incorrect' do
      @user = User.authenticate_with_credentials("tjonson@fakemail.com", "exa")
      expect(@user).to be nil
    end

    it 'should return nil if user does not exist' do
      @user = User.authenticate_with_credentials("bcurrie@fakemail.com", "example")
      expect(@user).to be nil
    end

    it 'should ignore whitespace and return user' do
      @user = User.authenticate_with_credentials(" tjonson@fakemail.com ", "example")
      expect(@user).to be_present
    end

    it 'should ignore case and return user' do
      @user = User.authenticate_with_credentials("tJonson@fakemail.com", "example")
      expect(@user).to be_present
    end

  end
  
end
