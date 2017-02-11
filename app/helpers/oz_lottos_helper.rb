module OzLottosHelper

  def range_count(first,last,lotto)
    array = (first..last).to_a
    a2 = [lotto.n1,lotto.n2,lotto.n3,lotto.n4,lotto.n5,lotto.n6,lotto.n7]
    count_result = (array - (array - a2)).count
    return count_result
  end

  def lotto_match(number)
    if @current_result.include?(number)
      return "lotto-match"
    elsif @current_sup.include?(number)
      return "sup-match"
    else
      return ""
    end
  end

  def isSup(i)
    if i > 6
      return "sup-match"
    end
  end

end
