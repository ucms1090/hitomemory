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

  def guest_sign_in
    memory = Memory.find_or_create_by!(email: 'guest@example.com') do |memory|
      memory.password = SecureRandom.urlsafe_base64
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      memory.memory_name = "GuestMemory"
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in memory
    redirect_to memory_root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def memory_params
    params.require(:memory).permit(:post_id, :email)
  end

end
