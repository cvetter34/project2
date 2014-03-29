require 'spec_helper'
require 'bcrypt'


describe User do
  it "is valid with an email" do
    user = User.new(
      email: 'cvetter34@gmail.com'
    )
    expect(user).to be_valid
    # expect(true).to be_true
  end

  it "is invalid without an email" do
    user = User.new
    expect(user).to be_invalid
  end

  it "is invalid without a salt"

  it "is invalid without a fish"

  it "is valid if password matches password_confirmation" do
    user = User.new(
      email: 'cvetter34@gmail.com',
      password: '123',
      password_confirmation: '123'
    )
    expect(user).to be_valid
  end

  it "is invalid if password doesn't match password_confirmation" do
    user = User.new(
      email: 'annieccheung@gmail.com',
      password: '123',
      password_confirmation: '12345'
    )
    expect(user).to be_invalid
  end

  it "should be able to generate a salt" do
    user = User.new(
      email: 'annieccheung@gmail.com',
      password: '123',
      password_confirmation: '12345'
    )
    user.instance_eval { encrypt_password }
    expect(user.salt).not_to be_empty
  end

  it "should be able to generate a fish" do
    user = User.new(
      email: 'annieccheung@gmail.com',
      password: '123',
      password_confirmation: '12345'
    )
    user.instance_eval { encrypt_password }
    expect(user.fish).not_to be_empty
  end

  it "should be a string in the email field" do
    user = User.new(
      email: 'annieccheung@gmail.com',
    )
    expect(user.email).to be_a String
  end

  it "should be a string in the password field" do
    user = User.new(
      email: 'annieccheung@gmail.com',
      password: '123'
    )
    expect(user.password).to be_a String
  end

  it "should be a string in the password confirmation field" do
    user = User.new(
      email: 'annieccheung@gmail.com',
      password: '123',
      password_confirmation: '123'
    )
    expect(user.password_confirmation).to be_a String
  end

  it "should authenticate a password by fish comparison" do
    user = User.new(
      email: 'annieccheung@gmail.com',
      password: '123',
      password_confirmation: '123'
    )
    user.instance_eval { encrypt_password }
    temp_password = '123'
    expect(user.authenticate(temp_password)).to be_true
  end

  it "should generate a code using the set_password_reset method" do
    user = User.new(
      email: 'annieccheung@gmail.com'
    )
    user.set_password_reset
    expect(user.code).not_to be_empty
  end

  it "should have expires_at field after calling set_password_reset" do
    user = User.new(
      email: 'annieccheung@gmail.com'
    )
    user.set_password_reset
    expect(user.expires_at).to be_true
  end

  it "should have an error when password is blank" do
    user = User.new(
      email: 'annieccheung@gmail.com'
    )
    params = {password: ""}
    user.reset_password(params)
    expect(user.errors).to be_true
  end

  it "should set the password" do
    user = User.new(
      email: 'annieccheung@gmail.com'
    )
    params = {password: "new"}
    user.reset_password(params)
    expect(user.password).not_to be_empty
  end

  it "should set the code to nil" do
    user = User.new(
      email: SecureRandom.urlsafe_base64,
      code: 'lol123',
      password: 'new',
      password_confirmation: 'new'
    )
    params = {password: "1", password_confirmation: "1"}
    user.reset_password(params)
    user.save
    expect(user.code).to be_nil
  end


end