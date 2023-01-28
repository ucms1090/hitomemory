class Admin::MemoriesController < ApplicationController

  def index
    @memories = Memory.all
  end

end
