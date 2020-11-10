require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :role => 1,
      :name => "MyString",
      :active => false,
      :email => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[role]"

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[active]"

      assert_select "input[name=?]", "user[email]"
    end
  end
end
