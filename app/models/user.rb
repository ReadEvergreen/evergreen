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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Send our users an email after signup
  after_create :send_signup_mail

  has_many :resources, :foreign_key => 'owner_id', :dependent => :destroy

  has_many :upvotes, :dependent => :destroy
  has_many :upvoted_resources, :through => :upvotes, :source => :resource

  def resource_total
    self.resources.count
  end

  def upvote_count
    self.upvotes.count
  end

  def send_signup_mail
  	ReaderMailer.signup(self).deliver_now
  end
  
end
