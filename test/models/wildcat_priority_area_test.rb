require "test_helper"

class WildcatPriorityAreaTest < ActiveSupport::TestCase
  test 'extents with polygon' do 
    bermuda = [26.468840334661323, 
               -74.95585551599015,
               37.6126981403826,
               -54.76298442224015]

    result = WildcatPriorityArea.within(*bermuda)

    assert 1, result.count
  end

  test 'extents no polygon' do 
    iceland = [62.13286920942739,
               -29.04885991271948,
               67.69961702955956,
               -8.855988818969536]

    result = WildcatPriorityArea.within(*iceland)

    assert 0, result.count
  end

  test 'gets zones inside' do
    bermuda = [25.346688401045476, -71.73249306285165]

    result = WildcatPriorityArea.contains(*bermuda)

    assert 1, result.count
  end

  test 'gets no zones outside' do
    iceland = [63.71908132538131, -20.02195210736899]

    result = WildcatPriorityArea.contains(*iceland)

    assert 1, result.count
  end
end
