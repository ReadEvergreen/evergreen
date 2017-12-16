# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :integer
#  last_sign_in_ip        :integer
#  user_type              :string           default("reader"), not null
#  username               :string
#

FactoryBot.define do

  factory :user, aliases: [:owner] do
    username  "user"
    sequence(:email) { |n| "test#{n}@test.com" }
    password  "password"
    user_type "curator"
  end

  factory :reader, :class => :user do
    username  "readerTester"
    email     "reader@test.com"
    password  "password"
    user_type "reader"
  end

  factory :curator, :class => :user do
    username  "curatorTester"
    email     "curator@test.com"
    password  "password"
    user_type "curator"
  end

  factory :admin, :class => :user do
    username  "adminTester"
    email     "admin@test.com"
    password  "password"
    user_type "admin"
  end

end
