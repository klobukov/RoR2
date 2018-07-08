require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "layout links" do
    get root_path
    assert_template 'static_pages/home' # проверка, что Home-страница создается на основе корректного представления
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path # проверяыет наличие ссылки a[href=contact_path]
  end

  test 'signup titile' do
  	get signup_path
  	# можем использовать ф-ию full_title т.к. добавили ApplicationHelper
  	# где она находится, в test_helper.rb
  	assert_select "title", full_title('Sign up')
  end
end
