require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "options are casted to hash and wrapped after dup" do
    u = User.new options: { "background" => "#FF0000" }
    u.save
    u.reload # necessary to reproduce

    u2 = u.dup

    assert u.options.is_a?(User::Options)
    assert u2.options.is_a?(User::Options)
  end
end
