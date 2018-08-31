class AddDescriptionToArticles < ActiveRecord::Migration[5.2]
  def change
    #指定したテーブルにカラムを追加。
    #add_column(テーブル名 カラム名, タイプ [, オプション])
    add_column :articles, :description, :text
    add_column :articles, :created_at,:datetime
    add_column :articles, :updated_at,:datetime
  end
end
