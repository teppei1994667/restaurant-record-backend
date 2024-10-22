class TestsController < ApplicationController
  def index
    tests = Test.all
    render status: 200, json: tests
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      return_test = Test.all
      render status: 200, json: return_test
    end
  end

  private

  def test_params
    params.require(:test).permit(:name, :email, :password)
  end
end
