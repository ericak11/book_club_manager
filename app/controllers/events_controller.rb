# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  date       :string
#  time       :string
#  location   :string
#  map        :string
#  partner_id :integer
#  book_id    :integer
#  notes      :string
#  created_at :datetime
#  updated_at :datetime
#

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :send_event_email]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    if params[:see_all]
      @events = Event.all.page params[:page]
      @all = true
    else
      @events = Event.future.page params[:page]
    end
      @partners = Partner.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @book = Book.new
    @partner = Partner.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    get_event_params
    @event = Event.new(@event_params)
    if params[:event][:location].present?
      location = params[:event][:location].gsub(" ", "+")+"+NY+NY"
      @event_params.merge!({map: "https://www.google.com/maps/embed/v1/place?key=#{ENV['GOOGLE_API_KEY']}&q=#{location}"})
    end
    respond_to do |format|
      if add_book  && @event.update(@event_params)
        EventNotifier.send_new_event_email(@event,current_user).deliver_now
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
      get_event_params
      if params[:event][:location].present?
        location = params[:event][:location].gsub(" ", "+")+"+NY+NY"
        @event_params.merge!({map: "https://www.google.com/maps/embed/v1/place?key=#{ENV['GOOGLE_API_KEY']}&q=#{location}"})
      end
      if add_book && @event.update(@event_params)
        EventNotifier.send_book_added_email(@event, current_user) if @send_new_book_email
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
  def send_event_email
    EventNotifier.send_event_reminder_email(@event,current_user).deliver_now
    flash[:success] = "Your Event Reminder Email was sent"
    redirect_to action: "show", id: @event.id
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
    def set_book
      @book = @event.book || Book.new
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def get_event_params
      @event_params = params[:event].permit(:date, :time, :location, :notes, :partner_id)
      @book_params = params[:event].require(:book).permit(:title, :link, :description, :author, :image, :publish_date)
    end
    def add_book
      unless @book_params.delete_if {|k,v| v.empty?}.empty?
        @book ||= Book.new()
        @send_new_book_email = !@book.id?
        @book_params.merge!({skip_date_validation: true})
        response = @book.update(@book_params)
        @event_params.merge!({book_id: @book.id}) if @book.present?
      end
      response.nil? ? true : response
    end
end
