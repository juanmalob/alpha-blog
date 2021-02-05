require 'test_helper'

describe "List categories", :integration do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end
  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "ravel")
  end

  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]" category_path(@category), text: @category.name
    assert_select "a[href=?]" category_path(@category2), text: @category2.name
  end
end
