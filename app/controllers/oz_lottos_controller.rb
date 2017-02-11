class OzLottosController < ApplicationController
  before_action :all_lottos, :load_results, only: [:index, :add, :destroy, :edit]
  before_action :set_lotto, only: [:edit, :update, :destroy]
  respond_to :html, :js
  include ApplicationHelper

  def index
    @current_result = last_result_array
    set_vacant_number(@oz_lottos)
  end

  def add
    @current_result = last_result_array
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
    @current_result = last_result_array
    @oz_lotto.update_attributes(lotto_params)
    all_lottos
    set_vacant_number(@oz_lottos)
  end

  def generate_result
    array = generate_lotto
    to_string = array.join(",") # convert array to string
    Result.destroy_all("id > 0")
    Result.create(lotto: to_string )
    @result = array
    @results = Result.all
    @current_result = last_result_array
  end

  def edit_result
    set_result
  end

  def update_result
    set_result
    # put params from form into a array
    array = [params[:n1],params[:n2],params[:n3],params[:n4],params[:n5],params[:n6],params[:n7]]
    # convert array to a string
    string = to_string(array)
    # update attribute in current result
    @result.update_attributes(lotto: string)
    # reload results and send @results to view
    load_results
    @current_result = last_result_array
    all_lottos
    set_vacant_number(@oz_lottos)

  end


  private
    def load_results
      @results = Result.all
    end

    def all_lottos
      @oz_lottos = OzLotto.all
    end

    def last_result_array
      to_array(Result.last.lotto)
    end

    def set_vacant_number(all_lottos)
      @vacant_number = vacant_number(all_lottos)
    end

    def set_lotto
      @oz_lotto = OzLotto.find(params[:id])
    end

    def set_result
      @result = Result.find(params[:id])
      # @result = to_array(result.lotto)
    end

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

    # def result_params
    #   params.require(:result).permit(:lotto)
    # end

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
