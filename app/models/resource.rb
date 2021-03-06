# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string           not null
#  media_type :string           default("")
#  approved   :boolean          default(FALSE), not null
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resource < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User'
  has_many :collection_resources
  has_many :collections, through: :collection_resources

  has_many :upvotes, :dependent => :destroy
  has_many :upvoted_users, :through => :upvotes, :source => :user

  validates :title, presence: true
  validates :url, presence: true
  # validates :url, :format => { :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/ }

  def description
    collection_resources.first&.description
  end

  def description=(description)
    collection_resources.update_all(description: description)
  end

  def owner_username
    self.owner&.username
  end

  def collection_titles
    collections.map(&:title).join(", ")
  end

  def upvote_count
    self.upvotes.count
  end

  def upvote_ids
    self.upvoted_users.pluck(:user_id)
  end

  def self.search(query)
    if query
      where('lower(title) LIKE ? OR lower(description) LIKE ?', "%#{query.downcase}%", "%#{query.downcase}%")
    else
      where("")
    end
  end
end
