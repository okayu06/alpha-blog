require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    #create actionあるか？
    get new_category_path
    #適切なテンプレート、レイアウトファイルが選択されているか
    assert_template 'categories/new'   
    #createで一つカテゴリーが増えたか
    assert_difference 'Category.count', 1 do
      post categories_path, params:{ category:{name:"sports"}}
      #リダイレクト実行後に続いて別のリクエストを行う予定があるのであれば、follow_redirect!を呼び出すことを忘れずに。
      follow_redirect!
    end  
    assert_template 'categories/index'
    #responseの内容と一致するか？
    assert_match "sports", response.body
  end
  
  test "invalid category submission results in falure" do 
    #create actionあるか？
    get new_category_path
    #適切なテンプレート、レイアウトファイルが選択されているか
    assert_template 'categories/new'   
    assert_no_difference 'Category.count' do
      post categories_path, params:{ category:{name:""}}
      
    end  
    assert_template 'categories/new'
    #check the existence of tags
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
end  