require "test_helper"

class CreateCategoriesTest < ActionDispatch::IntegrationTest
   
   def setup 
      @category = Category.create(name:"books")
      @category2 = Category.create(name:"programming")
   end
   
   test "should show categories listing" do
      get categories_path
      assert_template "categories/index"
      # verify if lists all categories, at the same time, see if they are links to the show page
      # 1 arg - refers to anchor tags
      # 2 arg - the href should go to category_path
      # 3 arg - the link text should display the name of the category
      assert_select "a[href=?]", category_path(@category), text: @category.name
      assert_select "a[href=?]", category_path(@category2), text: @category2.name
   end
end