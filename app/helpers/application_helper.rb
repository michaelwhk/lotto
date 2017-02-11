module ApplicationHelper


  def to_array(string)
    string.split(",").map { |s| s.to_i }
  end

  def to_string(array)
    array.join(",")
  end
end
