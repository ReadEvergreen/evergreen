# == Schema Information
#
# Table name: site_infos
#
#  id         :integer          not null, primary key
#  about      :string           default("Add About"), not null
#  contact    :string           default("Add Contact"), not null
#  mission    :string           default("Add Mission"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SiteInfo < ActiveRecord::Base
end
