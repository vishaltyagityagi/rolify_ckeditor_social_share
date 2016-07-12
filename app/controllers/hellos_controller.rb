class HellosController < ApplicationController
  before_action :set_hello, only: [:show, :edit, :update, :destroy]

  # GET /hellos
  # GET /hellos.json
  def index
    @hellos = Hello.all
  end

  # GET /hellos/1
  # GET /hellos/1.json
  def show
  end

  # GET /hellos/new
  def new
    @hello = Hello.new
  end

  # GET /hellos/1/edit
  def edit
  end

  # POST /hellos
  # POST /hellos.json
  def create
    # simple mailer
    # UserMailer.teacher_mailer(@message).deliver_now
    # delayed job mailer
    UserMailer.delay(run_at: Time.now+30.seconds).teacher_mailer(@message)

    @hello = Hello.new(hello_params)

    
  end

  # PATCH/PUT /hellos/1
  # PATCH/PUT /hellos/1.json
  def update
    respond_to do |format|
      if @hello.update(hello_params)
        format.html { redirect_to @hello, notice: 'Hello was successfully updated.' }
        format.json { render :show, status: :ok, location: @hello }
      else
        format.html { render :edit }
        format.json { render json: @hello.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hellos/1
  # DELETE /hellos/1.json
  def destroy
    @hello.destroy
    respond_to do |format|
      format.html { redirect_to hellos_url, notice: 'Hello was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hello
      @hello = Hello.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hello_params
      params.require(:hello).permit(:name)
    end
end
