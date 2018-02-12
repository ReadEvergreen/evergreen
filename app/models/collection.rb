# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text             not null
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Collection < ActiveRecord::Base
  belongs_to :category, required: true
  has_many :collection_resources
  has_many :resources, through: :collection_resources
  has_many :upvotes, :through => :resources
  has_one :synthesis_collection_resource, -> { synthesis }, class_name: 'CollectionResource'
  has_one :synthesis, through: :synthesis_collection_resource, source: :resource

  validates :title, presence: true, uniqueness: true
  validates :description, :length => { :in => 1..500 }

  def resource_total
    self.resources.length
  end

  def resource_names
    self.resources.map { |resource| [resource.title, resource.id] }
  end

  def synthesis_id
    synthesis&.id
  end

  def approved_IDs
    resources = self.resources.select { |resource| resource.approved }
    resource_ids = resources.map { |resource| resource.id }
    resource_ids.join(", ");
  end

  def self.most_recently_updated
    Collection.all.order('updated_at').limit(2)
  end

  def top_three
    resource_ids = self.upvotes.group('resource_id').order('count_id DESC').limit(3).count(:id)

    output = [[],[],[]]

    resource_ids.each do |id|
      output[0].push(Resource.find(id[0]))
      output[1].push(Resource.find(id[0]).owner.username)
      output[2].push(id[1])
    end

    output
  end

end
