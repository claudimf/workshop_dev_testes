require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :role => 0,
        :name => "Name",
        :active => false,
        :email => "teste@teste",
        :password => "123456"
      ),
      User.create!(
        :role => 0,
        :name => "Name",
        :active => false,
        :email => "teste1@teste",
        :password => "123456"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
