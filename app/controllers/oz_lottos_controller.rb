class OzLottosController < ApplicationController
  before_action :all_lottos, :load_results, only: [:index, :add, :destroy, :edit, :destroy]
  before_action :set_lotto, only: [:edit, :update, :destroy]
  respond_to :html, :js
  include ApplicationHelper

  def index
    get_last_result
    set_vacant_number(@oz_lottos)
  end

  # add one purchased lotto or generate lotto
  def add
    get_last_result
    # show generated lotto
    @lotto = generate_lotto(7)
    # put lotto into lottos list
    @oz_lottos.create(n1: @lotto[0], n2: @lotto[1], n3: @lotto[2], n4: @lotto[3], n5: @lotto[4], n6: @lotto[5], n7: @lotto[6])
    set_vacant_number(@oz_lottos)
  end

  # delete one purchased lotto
  def destroy
    @oz_lotto.destroy
    all_lottos
    get_last_result
    set_vacant_number(@oz_lottos)
  end

  # update one purchased lotto
  def update
    get_last_result
    @oz_lotto.update_attributes(lotto_params)
    all_lottos
    set_vacant_number(@oz_lottos)
  end

  # random generate a result
  def generate_result
    array = generate_lotto(9)
    to_string = array.join(",") # convert array to string
    Result.destroy_all("id > 0")
    Result.create(lotto: to_string )
    @result = array
    @results = Result.all
    get_last_result
    all_lottos
    set_vacant_number(@oz_lottos)

  end

  # manual edit generated result
  def edit_result
    set_result
  end

  def update_result
    set_result
    # put params from form into a array
    array = [params[:n1],params[:n2],params[:n3],params[:n4],params[:n5],params[:n6],params[:n7],params[:n8],params[:n9]]
    # convert array to a string
    string = to_string(array)
    # update attribute in current result
    @result.update_attributes(lotto: string)
    # reload results and send @results to view
    load_results
    get_last_result
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

    def get_last_result     # get current first 7 primary array and last 2 sup array
      @current_result = to_array(Result.last.lotto).shift(7)
      @current_sup = to_array(Result.last.lotto)
    end

    def set_vacant_number(all_lottos)          # update missing numbers
      @vacant_number = vacant_number(all_lottos)
    end

    def set_lotto
      @oz_lotto = OzLotto.find(params[:id])
    end

    def set_result
      @result = Result.find(params[:id])
      # @result = to_array(result.lotto)
    end

    # to know missing numbers
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

    # random genrate a array
    def generate_lotto(times)
      full_pool = (1..45).to_a
      result = []
      # create a result

      while times > 0   # 7time loops
        picked_number = full_pool.sample
        result << picked_number
        full_pool.delete(picked_number)
        times = times - 1
      end

      return result
    end

end
