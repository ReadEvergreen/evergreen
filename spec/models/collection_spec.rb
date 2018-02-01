# == Schema Information
#
# Table name: collections
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text             not null
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  synthesis_id :integer
#

RSpec.describe Collection, type: :model do
  subject { create(:collection) }

  describe "#title" do
    it "must be present" do
      subject.title = nil

      expect(subject).to be_invalid
    end

    it "must be unique" do
      duplicate_collection = subject.dup

      expect(duplicate_collection).to be_invalid
    end
  end
end
