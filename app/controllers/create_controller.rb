class CreateController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def ensure_correct_user
    @character = Character.find_by(id: params[:id])
    if @character.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}/user_home")
    end
  end

  def create_form
  end
  
  def create
    @character = Character.new(
      name: params[:name],
      sex: params[:sex],
      age: params[:age],
      race: params[:race],
      height: params[:height],
      hair: params[:hair],
      eye: params[:eye],
      skin: params[:skin],
      form: params[:form],
      dress: params[:dress],
      image_name: "default_user.jpg",
      personality1: params[:personality1],
      personality2: params[:personality2],
      personality3: params[:personality3],
      personality4: params[:personality4],
      personality5: params[:personality5],
      personality6: params[:personality6],
      user_id: @current_user.id,
      others1: params[:group]
    )
    @character.save
    if params[:image_name]
      @character.image_name = "#{@character.id}.jpg"
      image = params[:image_name]
      File.binwrite("public/user_images/#{@character.image_name}", image.read)
    end
    if @character.save
      flash[:notice] = "キャラクターを作成しました"
      redirect_to("/users/#{@current_user.id}/user_home")
    else
      render("create/create_form")
    end
  end

  def show
    @character = Character.find_by(id: params[:id])
  end

  def group
    @character = Character.find_by(id: params[:id])
    @characters = Character.where(
      user_id: @current_user.id,
      others1: @character.others1
    )
  end

  def edit
    @character = Character.find_by(id: params[:id])
  end

  def update
    @character = Character.find_by(id: params[:id])
    @character.name = params[:name]
    @character.sex = params[:sex]
    @character.age = params[:age]
    @character.race = params[:race]
    @character.height = params[:height]
    @character.hair = params[:hair]
    @character.eye = params[:eye]
    @character.skin = params[:skin]
    @character.form = params[:form]
    @character.dress = params[:dress]
    @character.personality1 = params[:personality1]
    @character.personality2 = params[:personality2]
    @character.personality3 = params[:personality3]
    @character.personality4 = params[:personality4]
    @character.personality5 = params[:personality5]
    @character.personality6 = params[:personality6]
    @character.others1 = params[:group]

    if params[:image_name]
      @character.image_name = "#{@character.id}.jpg"
      image = params[:image_name]
      File.binwrite("public/user_images/#{@character.image_name}", image.read)
    end

    if @character.save
      flash[:notice] = "キャラを編集しました"
      redirect_to("/users/#{@current_user.id}/user_home")
    else
      render("create/#{@character.id}/edit")
    end
  end

  def destroy
    @character = Character.find_by(id: params[:id])
    @character.destroy
    flash[:notice] = "キャラを削除しました"
    redirect_to("/users/#{@current_user.id}/user_home")
  end
end
