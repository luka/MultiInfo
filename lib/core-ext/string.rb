class String
  def camelize(first_letter_in_uppercase = true)
    if first_letter_in_uppercase
      self.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    else
      self[0].chr.downcase + camelize[1..-1]
    end
  end
end