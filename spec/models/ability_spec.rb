require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe 'validating a new user' do
    context ' with a role ":administrador"' do
      let!(:user_administrator) { create(:user_administrator) }
      it ' has the right permissions' do
        permissions = {:can=>{:index=>{"home"=>[]}, :manage=>{"all"=>[]}}, :cannot=>{}}
        expect(user_administrator.permissions).to eq(permissions)
      end
    end
    context ' with a role ":user"' do
      let!(:user_general) { create(:user_general) }
      it ' has the right permissions' do
        permissions = {:can=>{:index=>{"User"=>[], "home"=>[]}, :read=>{"User"=>[]}, :show=>{"User"=>[]}}, :cannot=>{}}
        expect(user_general.permissions).to eq(permissions)
      end
    end
  end
end
