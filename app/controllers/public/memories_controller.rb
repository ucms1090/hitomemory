class Public::MemoriesController < ApplicationController

  def search
    @memories = Memory.all
    @q = Memory.ransack(params[:q])
    @memory = @q.result
  end

  def index
    @memories = Memory.all
    @memory = Memory.new
  end

  def new
    @memory = Memory.new
  end

  def edit
    @memory = Memory.find(params[:id])
  end

  def show
    @memory = Memory.find(params[:id])
  end

  def create
    Memory.create(memory_params)
    redirect_to memory_path(Memory.id)
  end

  def update
    @memory = Memory.find(params[:id])
    if @memory.update(memory_params)
      redirect_to memory_path(@memory.id), notice: "success"
    else
      render edit
    end
  end

  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
    redirect_to memory_root_path
  end

  private

  def memory_params
    params.require(:memory).permit(:post_id, :email)
  end

end
