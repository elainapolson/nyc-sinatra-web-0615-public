class CreateFigures < ActiveRecord::Migration

  def change
    create_table :figures do |t|
      t.string :name
      t.integer :figure_titles_id
      t.timestamps null: false
    end 
  end 

end 