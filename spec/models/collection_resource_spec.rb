# == Schema Information
#
# Table name: collection_resources
#
#  id            :integer          not null, primary key
#  collection_id :integer          not null
#  resource_id   :integer          not null
#  description   :string
#  synthesis     :boolean          default(FALSE), not null
#

RSpec.describe CollectionResource, type: :model do
  subject { CollectionResource.new(resource: resource, collection: collection) }

  let(:resource) { create(:resource) }
  let(:collection) { create(:collection) }

  it "is valid" do
    expect(subject).to be_valid
  end

  # There should only be one synthesis per collection
  # A resource should only be a synthesis in one collection
  # A resource that is a synthesis only have one collection, which is the collection it's the synthesis for (in ResourceTest)
end
