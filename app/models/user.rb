class User < ApplicationRecord
	# не идеальный регексп для емейлов
	# это учебное приложение, а вообще НИКОГДА НЕ ИСПОЛЬЗУЙ РЕГЕКСП ДЛЯ ПРОВЕРКИ МЫЛА
	# существуют гемы и другие способы google : ruby on rails validate email format
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	before_save { self.email.downcase! }


	validates :name, 
		presence: true, 
		length: { maximum: 50 }

	validates :email, 
		presence: true, 
		length: { maximum: 255 }, 
		format: { with: VALID_EMAIL_REGEX}, 
		uniqueness: { case_sensitive: false } # уникальность мыла . чувствительно к регистру

	validates :password,
		presence: true,
		length: { minimum: 6 }
	# большая часть механики безопасного пароля
	# Единственное требование для запуска всего волшебста has_secure_password — 
	# это наличие у соответствующей модели атрибута password_digest.
	# добавляет к экземплярам метод authenticate, который принимает пароль как аргумент
	# возвращает объект из бд, если пароль верный, или false
	has_secure_password 
end
