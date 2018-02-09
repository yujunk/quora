
class AddQuestionForeignKey < ActiveRecord::Migration[5.0]

  def change

  	add_reference :questions, :user, foreign_key: true

  	#https://apidock.com/rails/v4.0.2/ActiveRecord/ConnectionAdapters/SchemaStatements/add_reference 
  	
  end

end


