module OzLottosHelper




  def range_count(first,last,lotto)
    array = (first..last).to_a
    a2 = [lotto.n1,lotto.n2,lotto.n3,lotto.n4,lotto.n5,lotto.n6,lotto.n7]
    count_result = (array - (array - a2)).count
    return count_result
  end

  


end
