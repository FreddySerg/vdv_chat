class CreateTableMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.boolean :active, :default => false

      t.timestamps
    end
  end
end