# == Schema Information
#
# Table name: earthquakes
#
#  id         :integer          not null, primary key
#  place      :string(255)
#  latitude   :float
#  longitude  :float
#  magnitude  :float
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EarthquakeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
