class EventsController < ApplicationController

  
  #Authenticate user when trying to edit, create or modify events(if it's not log in).
  before_action :authenticate_user!,except: [:index,:show]

    #Apply this method for this actions.
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  
  def index
  
    if params[:search_event].present?
       event_search= "#{params[:search_event]}"
       @events= Event.where("title ILIKE ?", "%#{event_search}%")
    
      # list_title = Event.search(params[:search_event]).order("start_date DESC")
      # @events=list_title.where('ends_date >= ?', Time.now).order("start_date DESC")
    else
      #Hide due date events
      @events=Event.where('ends_date >= ?', Time.now).order("start_date DESC")
    end
    # THIS IS GOING TO BE REFACTORED ASAP
    # SAYS JOSH
    if params[:search_location].present?
      location_search = "%#{params[:search_location]}%"
      @events= @events.where("location ILIKE ?", location_search)
    end
    if params[:drop_date] == 'Today'
      today_range = Date.today.beginning_of_day..Date.today.end_of_day
      @events=@events.where(start_date: today_range)

     elsif params[:drop_date] == 'Past events'
      @events=Event.where('ends_date <= ?', Time.now).order("start_date DESC")
      
    elsif params[:drop_date]=='Tomorrow'
      tomorrow = Date.today+1
      tomorrow_range = tomorrow.beginning_of_day..tomorrow.end_of_day
      @events=@events.where(start_date: tomorrow_range)

    elsif params[:drop_date]=='This week'
      week_range = Date.today.at_beginning_of_week..Date.today.at_end_of_week
      @events=@events.where(start_date: week_range)

    elsif params[:drop_date]=='This month'
      month_range = Date.today.at_beginning_of_month..Date.today.at_end_of_month
      @events=@events.where(start_date: month_range)
    end  
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @stale_form_check = Time.now.to_i
  end

  # GET /events/1/edit
  def edit

  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     
    def set_event
      
      @event = Event.find_by(id: params[:id]) or redirect_message
    end

    def redirect_message
      redirect_to '/404'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :location, :start_date, :ends_date, :image, :description, :organizer_name, :event_type)
    end
end
