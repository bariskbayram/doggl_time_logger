# frozen_string_literal: true

class TypesController < ApplicationController
  before_action :set_type, only: %i[show edit update destroy]
  before_action :user_logged_in?
  before_action :user_admin?

  def index
    @types = Type.all
  end

  def new
    @type = Type.new
  end

  def edit; end

  def create
    @type = Type.new(type_params)
    TempWorker.perform_async('CREATE A NEW TYPE')

    respond_to do |format|
      if @type.save
        format.html { redirect_to types_path, notice: 'Type was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @type.update(type_params)
        format.html { redirect_to types_path, notice: 'Type was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if check_is_there_related_entry(@type.id)
      respond_to do |format|
        format.html do
          redirect_to types_path, notice: 'Type was NOT destroyed. It has related entries which cannot destroyable.'
        end
      end
    else
      @type.destroy
      respond_to do |format|
        format.html { redirect_to types_path, notice: 'Type was successfully destroyed.' }
      end
    end
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:description)
  end

  def check_is_there_related_entry(id)
    Entry.where(type_id: id).length.positive?
  end
end
