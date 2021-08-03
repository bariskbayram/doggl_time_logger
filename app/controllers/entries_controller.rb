class EntriesController < ApplicationController
  before_action :is_user_logged_in
  before_action :set_entry, only: %i[ show edit update destroy ]

  def index
    if @current_user.is_admin && @entries.nil?
      @entries = Entry.all.order("start_time DESC")
    else
      @entries = Entry.where(user_id: @current_user.id).order("start_time DESC")
    end
  end

  def criteria
    if params

      user_params = params["user"]["id"].reject {|c| c.empty? }
      type = params["log"]["type_id"]
      start_time = time_value(params, "start_time")
      stop_time = time_value(params, "stop_time")
      start_checkbox = params["start"]["checkbox"]
      stop_checkbox = params["stop"]["checkbox"]

      @entries = Entry.all
      @entries = @entries.where(user_id: user_params) if user_params.present?
      @entries = @entries.where(type_id: type) if type.present?
      @entries = @entries.where('start_time > ?', start_time) if start_checkbox.present? && start_checkbox == "1"
      @entries = @entries.where('start_time < ?', stop_time) if stop_checkbox.present? && stop_checkbox == "1"

      @users = User.all
      
      render :index
    else
      redirect_to criteria_path
    end
  end

  def show
  end

  def new
    @entry = @current_user.entries.build
  end

  def edit
  end

  def create
    @entry = @current_user.entries.build(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: "Entry was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: "Entry was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:description, :start_time, :stop_time, :user_id, :type_id)
    end
end
