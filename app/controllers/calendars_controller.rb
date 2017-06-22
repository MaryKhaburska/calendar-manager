class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  def index
    @calendars = Calendar.all
  end

  def show
  end

  def new
    @calendar = Calendar.new
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to @calendar
      flash[:notice] = "Calendar was successfully created."
    else
      render :new
    end
  end

  def update
    if @calendar.update(calendar_params)
      redirect_to @calendar
      flash[:notice] = "Calendar was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @calendar.destroy
    redirect_to calendars_path
    flash[:notice] = "Calendar was successfully deleted."
  end

  private
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    def calendar_params
      params
        .require(:calendar)
        .permit(:name, :trackable, :count, :ical_link,
                :user_id, :plan_id)
    end
end
