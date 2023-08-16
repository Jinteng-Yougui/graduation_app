class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]

  # GET /bookings or /bookings.json
  def index
    if params[:q]
      @bookings = @q.result
    else
      @bookings = current_user.bookings
    end
    @user = current_user
    @booking_events = Booking.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
    @bookings = @bookings.page(params[:page]).per(5)
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    if params[:default_date].present?
      @default_date = params[:default_date].to_date
    end
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
    
    respond_to do |format|
      if @booking.save
        selected_date = params[:booking][:start_time]
        contact = Contact.find_by(name: "contact_id")
        EmailMailer.send_mail(@booking).deliver
          
        format.html { redirect_to booking_url(@booking), notice: "祝い言を登録しました。" }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "祝い言を編集しました。" }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "祝い言を削除しました。" }
      format.json { head :no_content }
    end
  end

  def search
    @results = @q.result
    @user = current_user
    render :index
  end

  private

  def set_q
    @q = current_user.bookings.ransack(params[:q])
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:title, :content, :date_on, :contact_id, :category_id, :start_time)
  end
end
