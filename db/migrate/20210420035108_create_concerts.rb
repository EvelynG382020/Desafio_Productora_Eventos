class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.integer :public
      t.integer :duration
      t.date :concert_date
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
