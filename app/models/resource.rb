# == Schema Information
#
# Table name: resources
#
#  id            :integer          not null, primary key
#  title         :string           not null
#  url           :string           not null
#  description   :string           default("")
#  media_type    :string           default("")
#  approved      :boolean          default(FALSE), not null
#  owner_id      :integer
#  collection_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Resource < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User'
  belongs_to :collection, required: true

  has_many :upvotes, :dependent => :destroy
  has_many :upvoted_users, :through => :upvotes, :source => :user

  validates :title, :length => { :in => 1..200 }
  validates :description, :length => { :in => 0..1000 }
  # validates :url, :format => { :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/ }

  after_save :add_http

  def owner_username
    self.owner.username
  end

  def collection_name
    self.collection.title
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

  def add_http
    if /\Ahttp/.match(self.url).nil?
      url = 'http://' + self.url
      self.update_attributes(:url => url)
    end
  end
  
end
