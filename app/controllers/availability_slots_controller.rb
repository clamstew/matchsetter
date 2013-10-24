class AvailabilitySlotsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @availability = current_user.availability_slots

    @users = []
    @used_ids = []
    
    @availability.each do |slot|
      @these_users = User.joins(:availability_slots).where("day = ? AND time = ?", slot.day, slot.time) # for finding users
      @these_users.each do |user| 
        @users << user unless user.id.in?(@used_ids)
        @used_ids << user.id
      end
    end
  end

  def new
    @user = current_user
    @slots = []
    # i = 1
    21.times do 
      @slots << @user.availability_slots.new
      # i +=1
    end
  end

  def create
    # remove all user slots before save
    current_user.availability_slots.destroy_all 
    # grab the availability slots days param
    @something = params[:availability_slots][:day]
    # save a new row for each users availability slot
    @something.each do |k, v|
      k = k.split('-')
      current_user.availability_slots.create(user_id: current_user.id, day: k[0], time: k[1]) if v != '0'# && v != nil
    end
    respond_to do |format|
      format.html { redirect_to :availability_index, notice: 'Availability Preferences Saved.' }
    end
  end
end