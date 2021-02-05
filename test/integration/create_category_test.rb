require 'test_helper'

describe "Create category", :integration do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end
  test "get new category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Sports"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category form and reject invalid submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: " "} }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
