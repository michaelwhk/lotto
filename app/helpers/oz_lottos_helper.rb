module OzLottosHelper




  def range_count(first,last,lotto)
    array = (first..last).to_a
    a2 = [lotto.n1,lotto.n2,lotto.n3,lotto.n4,lotto.n5,lotto.n6,lotto.n7]
    count_result = (array - (array - a2)).count
    return count_result
  end

  def vacant_number(lottos)
    pool = (1..45).to_a
    lottos.each do |l|
      pool = pool - l
    end
    return pool
  end


end
