class PalpitesController < ApplicationController
  before_action :set_palpite, only: [:show, :edit, :update, :destroy]

  # GET /palpites
  # GET /palpites.json
  def index
    @usuario = Usuario.find(params[:usuario])
    @palpites = Palpite.where({:usuario_id => params[:usuario]})
    @jogos = Jogo.all
  end

  # GET /palpites/1
  # GET /palpites/1.json
  def show
  end

  # GET /palpites/new
  def new
    @palpite = Palpite.new
    @jogo = Jogo.new
    #@palpites = Palpite.all
    @jogos = Jogo.all

    @palpites ||= []

    @jogos.each do |jog|
      @palp = Palpite.new
      @palp.jogo_id = jog.id
      @palpites << @palp
    end

    if params[:jogo]
      @palpite.jogo = Jogo.find(params[:jogo])
    end
    if params[:usuario]
      @palpite.usuario = Usuario.find(params[:usuario])
    end
  end

  # GET /palpites/1/edit
  def edit
  end

  # POST /palpites
  # POST /palpites.json
  def create
    # @palpite = Palpite.new(palpite_params)

    # respond_to do |format|
    #   if @palpite.save
    #     format.html { redirect_to @palpite, notice: 'Palpite was successfully created.' }
    #     format.json { render :show, status: :created, location: @palpite }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @palpite.errors, status: :unprocessable_entity }
    #   end
    # end

    #binding.pry
    @palpites = params[:palpite]
    @sizeList = params[:palpite].size
    logger.debug "Palpites: #{@palpites} - count: #{@sizeList}"
    
    @usuario=""
    @palpites.each do |params,values|
      logger.debug "Palpite: #{values[:id]}"
      palpite = Palpite.find {values[:id]}
      @savePalpite = palpite.update_attributes(:gols_a => values[:gols_a], :gols_b => values[:gols_b])
      @usuario=palpite[:usuario_id]
      if @savePalpite == false
        logger.debug "Palpite salvo: #{@savePalpite} tem erros: #{palpite.errors.count} - #{palpite.errors.messages}"
      end
      @usuario=values[:usuario_id]
    end
    flash[:notice] = "Updated palpite"
    redirect_to action: "index", :usuario => @usuario

  end

  # PATCH/PUT /palpites/1
  # PATCH/PUT /palpites/1.json
  def update
    respond_to do |format|
      if @palpite.update(palpite_params)
        format.html { redirect_to @palpite, notice: 'Palpite was successfully updated.' }
        format.json { render :show, status: :ok, location: @palpite }
      else
        format.html { render :edit }
        format.json { render json: @palpite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palpites/1
  # DELETE /palpites/1.json
  def destroy
    @palpite.destroy
    respond_to do |format|
      format.html { redirect_to palpites_url }
      format.json { head :no_content }
    end
  end


  #------------
  def update_multiple
    @palpite = Palpite.find(params[:palpite_ids])
    @palpite.each do |palpite|
      palpite.update_attributes!(params[:palpite].reject { |k,v| v.blank? })
    end
    flash[:notice] = "Updated palpite"
    redirect_to palpite_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_palpite
      @palpite = Palpite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def palpite_params
      params.require(:palpite).permit(:usuario_id, :jogo_id, :gols_a, :gols_b, :pontos)
    end

    def prepare_form
      @jogo = Jogo.order :id
      @usuario = Usuario.order :nome
    end
end
