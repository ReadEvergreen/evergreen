# == Schema Information
#
# Table name: upvotes
#
#  id          :integer          not null, primary key
#  resource_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Upvote < ActiveRecord::Base

  belongs_to :user
  belongs_to :resource
  validates_uniqueness_of :resource_id, :scope => :user_id

end
