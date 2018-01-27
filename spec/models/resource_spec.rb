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

RSpec.describe Resource, type: :model do

  subject { Resource.new(title: title, url: url) }

  let(:title) { "Test Resource" }
  let(:url) { "testurl.example.com" }

  it "is valid" do
    expect(subject).to be_valid
  end

  it { should belong_to(:owner) }
  it { should have_many(:upvotes).dependent(:destroy) }
  it { should have_many(:upvoted_users).through(:upvotes) }

  describe "#url" do
    it "must be present" do
      subject.url = nil

      expect(subject).to_not be_valid
    end
  end
end
