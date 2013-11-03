require 'minitest/autorun'
require_relative 'phone_number'

class PhoneNumberTest < MiniTest::Unit::TestCase

  def test_cleans_number
    number = PhoneNumber.new("(123) 456-7890").number
    assert_equal "1234567890", number
  end

  def test_cleans_number_with_dots
    number = PhoneNumber.new("123.456.7890").number
    assert_equal "1234567890", number
  end

  def test_valid_when_11_digits_and_first_is_1
    number = PhoneNumber.new("11234567890").number
    assert_equal "1234567890", number
  end

  def test_invalid_when_11_digits
    number = PhoneNumber.new("21234567890").number
    assert_equal "0000000000", number
  end

  def test_invalid_when_9_digits
    number = PhoneNumber.new("123456789").number
    assert_equal "0000000000", number
  end

  def test_area_code
    number = PhoneNumber.new("1234567890")
    assert_equal "123", number.area_code
  end

  def test_pretty_print
    number = PhoneNumber.new("1234567890")
    assert_equal "(123) 456-7890", number.to_s
  end

  def test_pretty_print_with_full_us_phone_number
    number = PhoneNumber.new("11234567890")
    assert_equal "(123) 456-7890", number.to_s
  end

end
