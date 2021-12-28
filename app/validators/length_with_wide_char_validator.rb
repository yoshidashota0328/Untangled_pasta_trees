class LengthWithWideCharValidator < ActiveModel::EachValidator
  #validate :length_with_wide_char_validator
  
  def validate_each(record, attribute, value)
    count = 0 
    value.split(//).each do |v| 
      v.bytesize > 1 ? count += 2 : count += 1
    end 
    record.errors[attribute] << (options[:message] || ": The maximum length is %d characters for single-byte characters and half of that for double-byte characters." % options[:maximum]) if count > options[:maximum]
  end 
end