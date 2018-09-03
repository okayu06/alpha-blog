class AddUserIdToArticles < ActiveRecord::Migration[5.2]
  def change
    #新しいからむをarticleに加える
    add_column :articles, :user_id, :integer
  end
end
