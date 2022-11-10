class AddArticlesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :articles, null: false, foreign_key: true
  end
end
