require "test_helper"

class CreateCategoriesTest < ActionDispatch::IntegrationTest
   
   test "get new category form and create category" do
      ### simulating a addition of a new category, user behavior ###
      # get the new category path - new form 
      get new_category_path
      # afirm/assert the template
      assert_template "categories/new"
      # now, the user have to be able to create the category and display somewhere ...
      # follow: means that in the category, must have a difference of one after |do|
      assert_difference "Category.count", 1 do 
         #after this action, must have a difference of one
         # submission - POST request to the categories path
         # redirected to the CREATE action, passing data along POSTING
         # after comma, is the data: 
         post_via_redirect categories_path, category: {name: "sports"}
      end
      #after the POST action ...send user to categories listing page INDEX
      assert_template "categories/index"
      #verify that the recently created category name is displayed correctly
      # 1 arg - expects the "sports" string 
      # 2 arg - where are we expecting this, the page this will display
      assert_match "sports", response.body
   end
   
   test "invalid category submission results in failure" do
      get new_category_path
      assert_template "categories/new"
      
      # check for no difference after executign |do| - 
      #it means that the category wasn't created, so error!
      assert_no_difference "Category.count" do
         #change to post, because after error, we are not redirecting
         post categories_path, category: {name:""} 
         #name: is empty, will raise the error validation messages
         #If name is empty, new category is not created by the controller 
         #and hence no difference in the count.
      end
      assert_template "categories/new"
      # ensure validation messages are showing up in error cases!
      # looking for the existence of the content inside quotes
      assert_select "div.alert.alert-danger"
      assert_select "p#err_msg"
   end
   
   
end