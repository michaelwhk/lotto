class OzLottosController < ApplicationController
  before_action :all_lottos, only: [:index, :add, :destroy, :edit]
  before_action :set_lotto, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def index
    set_vacant_number(@oz_lottos)
  end

  def add
    # show generated lotto
    @lotto = generate_lotto
    # put lotto into lottos list
    @oz_lottos.create(n1: @lotto[0], n2: @lotto[1], n3: @lotto[2], n4: @lotto[3], n5: @lotto[4], n6: @lotto[5], n7: @lotto[6])
    set_vacant_number(@oz_lottos)
  end

  def destroy
    @oz_lotto.destroy
    set_vacant_number(@oz_lottos)
  end

  def update
    @oz_lotto.update_attributes(lotto_params)
    all_lottos
    set_vacant_number(@oz_lottos)
  end

  def generate_result
    @result = generate_lotto
  end


  private
    def all_lottos
      @oz_lottos = OzLotto.all
    end

    def set_vacant_number(all_lottos)
      @vacant_number = vacant_number(all_lottos)
    end

    def set_lotto
      @oz_lotto = OzLotto.find(params[:id])
    end

    # def range_count(start,end,lotto)
    #   array = (start...end).to_a
    #   a2 = [lotto.n1,lotto.n2,lotto.n3,lotto.n4,lotto.n5,lotto.n6,lotto.n7]
    #   count_result = (array - (array - a2)).count
    #   return count_result
    # end
    def vacant_number(lottos)
      pool = (1..45).to_a
      lottos.each do |l|
        array = [l.n1,l.n2,l.n3,l.n4,l.n5,l.n6,l.n7]
        pool = pool - array
      end
      return pool
    end

    def lotto_params
      params.require(:oz_lotto).permit(:n1, :n2, :n3, :n4, :n5, :n6, :n7)
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
