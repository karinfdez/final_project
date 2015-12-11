# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  title          :string
#  location       :string
#  start_date     :datetime
#  ends_date      :datetime
#  image          :string
#  description    :string
#  organizer_name :string
#  event_type     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
