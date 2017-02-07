class OzLottosController < ApplicationController
  def index
    # generate_result
    @result = []
    # @oz_lottos = OzLotto.all
  end

  def add

  end

  def remove
  end


  def generate_result
    # initial a candidate pool
    full_pool = (1..45).to_a
    @oz_lottos = OzLotto.all
    @result = []
    # create a result
    times = 7
    while times > 0
      picked_number = full_pool.sample
      @result << picked_number
      full_pool.delete(picked_number)
      times = times - 1
    end
    render :index
    # return result
  end


  # array.delete(obj) - delete obj from array and return obj

  # array.sample - pick up a element from array return the element
end
