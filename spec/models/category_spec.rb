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

RSpec.describe Category, type: :model do
  subject(:category) { Category.create(title: "Building the Team") }

  it "has a unique title" do
    duplicate_category = category.dup

    expect(duplicate_category).to be_invalid
  end
end
