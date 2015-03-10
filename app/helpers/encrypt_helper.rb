module EncryptHelper

  def rot(value, num = 13)
    value.split('').collect { |ch|
      if /^[a-z]$/ === ch
        ((ch.bytes[0] + num - 'a'.bytes[0]) % 26 + 'a'.bytes[0]).chr
      elsif /^[A-Z]$/ === ch
        ((ch.bytes[0] + num - 'A'.bytes[0]) % 26 + 'A'.bytes[0]).chr
      else
        ch
      end
    }.join('')
  end

end
