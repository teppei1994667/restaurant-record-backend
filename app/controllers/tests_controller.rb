class TestsController < ApplicationController
  def index
    tests = Test.all
    render status: 200, json: {tests: tests}
  end
end
