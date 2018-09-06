require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    #テストにおいて操作の一番最初に行う。テストが終わったら全てのデータは消える。
    @category = Category.new(name: "sports")  
  end 
  
  test "category should be valid" do
    #categoryモデル、テーブル、マイグレーションができてるかテスト。できてなかったら、false返す。
    assert @category.valid?
  end
  
  test "name should be present" do
    #nameに関するvalidationがなかったら、空白でも通ってしまい、asesert_notでfalse返す。validationしていたら、@category.valid? = falsとなり、assert_notはtrue返す。
    @category.name = " "
    assert_not @category.valid?
  end  
  
  test "name should be unique" do
    #同じものを認めるかどうか,validationのチェック。
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end  
  
  test "name should be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end 
  
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end  
  
end  