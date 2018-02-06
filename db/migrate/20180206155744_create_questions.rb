
class CreateQuestions < ActiveRecord::Migration[5.0]

  def change
  	create_table :questions do |t|
  		t.string :text
  		t.string :username
  		t.string :upvote
  		t.timestamps
  	end
  end

end

