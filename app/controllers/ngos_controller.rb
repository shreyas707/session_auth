class NgosController < ApplicationController
  before_action :set_ngo, only: [:show, :edit, :update, :destroy]
  skip_before_filter
  # GET /ngos
  # GET /ngos.json
  def index
    @ngos = Ngo.all
    # reset_session
  end

  # GET /ngos/1
  # GET /ngos/1.json
  def show
  end

  # GET /ngos/new
  def new
    @ngo = Ngo.new
  end

  # GET /ngos/1/edit
  def edit
  end

  # POST /ngos
  # POST /ngos.json
  def create
    @ngo = Ngo.new(ngo_params)

    respond_to do |format|
      if @ngo.save
        format.html { redirect_to @ngo, notice: 'Ngo was successfully created.' }
        format.json { render :show, status: :created, location: @ngo }
      else
        format.html { render :new }
        format.json { render json: @ngo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ngos/1
  # PATCH/PUT /ngos/1.json
  def update
    respond_to do |format|
      if @ngo.update(ngo_params)
        format.html { redirect_to @ngo, notice: 'Ngo was successfully updated.' }
        format.json { render :show, status: :ok, location: @ngo }
      else
        format.html { render :edit }
        format.json { render json: @ngo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ngos/1
  # DELETE /ngos/1.json
  def destroy
    @ngo.destroy
    respond_to do |format|
      format.html { redirect_to ngos_url, notice: 'Ngo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_students
    if session[:ngo_id].present?
      render ngos_add_students_path
    else
      redirect_to '/', alert: "Please login with NGO name and password to access this page."
    end
  end

  def verify_sign_in

    @ngo = Ngo.find_by(name: params[:name])
    
    if @ngo.present?
      if @ngo.authenticate(params[:password])
        session[:ngo_id] = @ngo.id
        binding.pry
        redirect_to new_user_registration_path, alert: "Signed in successfully."
      else
        redirect_to :back, alert: "Password entered is wrong. Please try again."
      end
    else
      redirect_to :back, alert: "NGO doesn't exist."
    end

  end

  def sign_out
    session.delete("ngo_id")
    redirect_to '/', alert: "Signed out successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ngo
      @ngo = Ngo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ngo_params
      params.require(:ngo).permit(:name, :password)
    end
end
