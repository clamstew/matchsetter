class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :set_ntrp_vars, only: [:new, :new_solo]

  # GET /matches
  # GET /matches.json
  def index
    @matches = current_user.matches
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @users  = User.where("skillset >= ? AND skillset <= ?", @ntrp_floor, @ntrp_ceiling) # for finding users
    @match  = Match.new
    @match.players.build
  end

  # used when clicing on the create match button for a specific user
  # such as on the location page that lists users
  def new_solo
    @user   = User.find(params[:id])
    @match  = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)
    # creates a player on match but does not save it yet
    @match.players.build(user_id: current_user.id)

    respond_to do |format|
      if @match.save && @match.errors.empty?
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render action: 'show', status: :created, location: @match }
      elsif @match.errors.empty? == false
        @errors = []
        @match.errors.messages.each do |x, y| 
          @errors << y
        end
        format.html { redirect_to new_match_path, alert: "Errors: #{@errors.join(', ').titleize}." }
      else
        format.html { render action: 'new', :alert => "Unable to update user. #{@match.errors}" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # used when clicing on the create match button for a specific user
  # such as on the location page that lists users
  def create_solo
    @match = Match.new(match_params)
    @match.players.build(user_id: current_user.id) # me as player
    @match.players.build(user_id: params[:id]) #opponent as player

    respond_to do |format|
      if @match.save && @match.errors.empty?
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render action: 'show', status: :created, location: @match }
      elsif @match.errors.empty? == false
        format.html { redirect_to new_match_path, alert: "#{@match.errors.messages}" }
      else
        format.html { render action: 'new', :alert => "Unable to update user. #{@match.errors}" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    def set_ntrp_vars
      @ntrp_floor = (current_user.skillset - 0.5) if current_user.skillset
      @ntrp_ceiling = (current_user.skillset + 0.5) if current_user.skillset
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:game_time, :court_id, players_attributes: [:user_id])
    end
end
