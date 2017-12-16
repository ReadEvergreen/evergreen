# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  sector_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base

  belongs_to :sector, required: true
  has_many :collections, :foreign_key => :category_id, :dependent => :nullify
  has_many :resources, :through => :collections

  validates :title, presence: true, uniqueness: true

  def collection_total
    self.collections.count
  end

  def resource_total
    self.resources.count
  end

end
