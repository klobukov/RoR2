module ApplicationHelper
	# module - может быть потом включен в класс с помощью include
	# Rails делает это включение за нас, поэтому наш хэлпер с его методами доступен везде (почти :) )
	def full_title(page_title="")
		# если не предоставлен заголовок, возвращаем базовый, иначе его | базовый
		base_title = "SampleApp"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title 
		end
	end
end
