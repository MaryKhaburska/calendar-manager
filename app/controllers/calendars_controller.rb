class CalendarsController < ApplicationController
  include CalendarsHelper
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
      create_events if calendar_params[:ical_link].present?
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

    def create_events
      file = File.open("public/uploads/test_cal.ics")
      parsed_events = parse_ics(file)
      parsed_events.map do |e|
        @calendar.events.create(e) unless Event.where(uuid: e[:uuid]).present?
      end
      actualize_count(@calendar)
    end
end
