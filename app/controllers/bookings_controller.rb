class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
    @user = current_user
    @bookings = @bookings.page(params[:page]).per(5)
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
    
    respond_to do |format|
      if @booking.save
        contact = Contact.find_by(name: @booking.name)
        selected_date = params[:booking][:date_on]
        if contact
          EmailSender.send_scheduled_email(contact.email, @booking.content, @booking.date_on)
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
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

    render :index
  end

  private

  def set_q
    @q = Booking.ransack(params[:q])
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:title, :content, :date_on, :contact_id, :category_id)
  end
end
