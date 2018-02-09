
class AddColumnToUser < ActiveRecord::Migration[5.0]

  def change

  	add_column :users, :random_string, :string

  	#https://apidock.com/rails/v4.0.2/ActiveRecord/ConnectionAdapters/SchemaStatements/add_reference 
  	
  end

end


