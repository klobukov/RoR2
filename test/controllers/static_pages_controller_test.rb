require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

	# эта функция запускается автоматически перед каждым тестом
	def setup
		# объявим instance переменную, доступнуюво всем классе, с помощью @
		@base_title = "SampleApp"
	end


  test "should get home" do
    # home_url - полный путь т.е. example.com/home
    get root_url
    #assert_response - проверяет каким должен быть ответ сервера на запрос.
    #success это 200,успех
    assert_response :success
    #assert_select - метод, который тестирует наличие определенного тега HTML
    #после запятой его содержимое
    # #{@base_title} - вызов переменной класса 
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
  	get about_url
  	assert_response :success
  	assert_select "title", "About | #{@base_title}"
  end

  test "should get contacts" do
    get contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
