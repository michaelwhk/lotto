class OzLottosController < ApplicationController
  before_action :all_lottos, only: [:index, :add, :remove]
  before_action :set_lotto, only: [:remove]
  respond_to :html, :js

  def index

  end

  def add
    @lotto = generate_lotto
    @oz_lottos.create(n1: @lotto[0], n2: @lotto[1], n3: @lotto[2], n4: @lotto[3], n5: @lotto[4], n6: @lotto[5], n7: @lotto[6])
  end

  def remove
    @oz_lotto.destroy
  end


  def generate_result
    @result = generate_lotto
  end


  private
    def all_lottos
      @oz_lottos = OzLotto.all
    end

    def set_lotto
      @oz_lotto = OzLotto.find(params[:id])
    end

    def generate_lotto
      full_pool = (1..45).to_a
      result = []
      # create a result
      times = 7

      while times > 0   # 7time loops
        picked_number = full_pool.sample
        result << picked_number
        full_pool.delete(picked_number)
        times = times - 1
      end

      return result
    end
  # array.delete(obj) - delete obj from array and return obj

  # array.sample - pick up a element from array return the element
end
