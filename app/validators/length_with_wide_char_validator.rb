# frozen_string_literal: true

class LengthWithWideCharValidator < ActiveModel::EachValidator
  # validate :length_with_wide_char_validator

  def validate_each(record, attribute, value)
    count = 0
    value.split(//).each do |v|
      count += v.bytesize > 1 ? 2 : 1
    end
    if count > options[:maximum]
      record.errors[attribute] << (options[:message] || ': The maximum length is %d characters for single-byte characters and half of that for double-byte characters.' % options[:maximum])
    end
  end
end
