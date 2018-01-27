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

  it { should belong_to(:category) }
  it { should belong_to(:synthesis).with_foreign_key(:synthesis_id) }

end
