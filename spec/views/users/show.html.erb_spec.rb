require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :role => 0,
      :name => "Name",
      :active => false,
      :email => "teste@teste",
      :password => "123456"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/administrator/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/teste@teste/)
  end
end
