class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
  	# rails-метод add_index
  	add_index :users, :email, unique: true
  end
end
