require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foo123", 
    	password_confirmation: "foo123")
  end

  test "should be valid" do
    assert @user.valid?, "not fucking valid"
  end

  test "name should be present" do
  	@user.name = "   "
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = " "
  	assert_not @user.valid?
  end

  test "name should not be more 50 symbols" do
  	@user.name = "a"*51
  	assert_not @user.valid?
  end

  test "email string should not be more 255 symbols" do
  	@user.email = "a"*244 + "@example.com"
  	assert_not @user.valid?
  end

  test "email validation should accept valid adresses" do
  	valid_adresses = ['vova@mail.ru', 'jopa.skol@ya.ru.ro', 'sukamla@rambler.ua']

  	valid_adresses.each do |valid_adress|
  		@user.email = valid_adress
  		# второй аргумент - это сообщение об ошибке , если тест не прошел
  		# полезно использовать в циклах для тестов, чтоб узнать какое именно значение вызвало сбой
  		assert @user.valid?, "#{valid_adress.inspect} should be valid"
  	end
  end

  test "email validation should reject invalid adresses" do
  	invalid_adresses = ['vava.mail.ru', 'vovo@mailru', 'vova@mail,ru', '@mail.vova']

  	invalid_adresses.each do |invalid_adress|
  		@user.email = invalid_adress
  		assert_not @user.valid?, "#{invalid_adress.inspect} should not be valid"
  	end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present" do
  	@user.password = @user.password_confirmation = " "*6
  	assert_not @user.valid?
  end

  test "password should contain 6+ symbols" do
  	@user.password = @user.password_confirmation = "a"*5
  	assert_not @user.valid?
  end

end
