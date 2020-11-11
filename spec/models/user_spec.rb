# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  active                 :boolean          default(TRUE)
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Creating user,' do
    context ' should not be valid' do
      let!(:user) { build(:user, email: nil, role: nil)}
      let!(:user_2) { build(:user)}

      before(:each) do
        user.valid?
      end

      it ' without email and role' do
        expect(user).to_not be_valid
      end
      it ' without email and return message' do
        expect(user.errors.messages[:email].size).to eq(1)
        expect(user.errors.messages[:email].first).to_not be("can't be blank")
      end
      it ' without role' do
        expect(user.errors.messages[:role].size).to eq(1)
        expect(user.errors.messages[:role].first).to_not be("can't be blank")
      end

      context ' without a valid role' do
        let!(:invalid_role) { (:teste) }
        it ' get an ArgumentError' do
          expect { user_2.role = invalid_role }.to raise_error(ArgumentError)
        end

        it ' get an ArgumentError' do
          expect { user_2.role = invalid_role }.to raise_error(an_instance_of(ArgumentError).and having_attributes(message: "'#{invalid_role}' is not a valid role"))
        end
      end
    end

    context ' should be valid' do
      let!(:user) { build(:user, email: "teste@teste.com", role: :administrator)}

      before(:each) do
        user.valid?
      end

      it ' with email and role' do
        expect(user).to be_valid
      end
      it ' with email and role and return any messages' do
        expect(user.errors.messages).to be_blank
      end
    end
  end
  describe 'Updating user, should not be valid ' do
    let!(:user) { create(:user)}

    it ' without email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it ' without role' do
      user.role = nil
      expect(user).to_not be_valid
    end
  end
end
