# rails generate controller StaticPages home help
# команда выше создает новый контроллер с пустыми методами home и help
# так же создается папка static_pages во view с файлами help.html.erb, home.html.erb
# а так же файлы скриптов, стилей и т.д . Ruby > sample_app > controller creation
class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end
end
