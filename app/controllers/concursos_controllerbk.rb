class ConcursosController < ApplicationController
require 'mongoid'
require 'will_paginate/collection'
require 'carrierwave/mongoid'

 #before_action :validate_user, except: [:show, :index]
  before_action :authenticate_user!,  except: [:show, :index]
 before_action :set_concurso, except: [:index, :new, :create]
  #before_action :set_archivo, except: [:show, :edit, :update, :destroy]



  # GET /concursos
  # GET /concursos.json
  def index
    @concursos = Concurso.paginate(:page => params[:page], :per_page => 10)
    #@concursos = Concurso.all
  end

  # GET /concursos/1
  # GET /concursos/1.json
  def show

  #@concurso = Concurso.find(params[:concurso_url])
  #@archivo = concurso.archivos.paginate(:page => params[:page], :per_page => 1)
  #@concurso= Concurso.find(params[:concurso_url]) 
  #@concurso = Concurso.new(params[:concurso_url])
 # @archivo.concurso= @concurso
  #@archivo = Archivo.new(archivo_params)
  #@archivo = concurso.archivos.paginate(:page => params[:page], :per_page => 1)
 @archivos = @concurso.archivos.paginate(:page => params[:page], :per_page => 2)
 @archivo = Archivo.new
  end

  # GET /concursos/new
  def new
    @concurso = Concurso.new
  end

  # GET /concursos/1/edit
  def edit
  end

  # POST /concursos
  # POST /concursos.json
  def create
    
   @concurso = current_user.concursos.new(concurso_params)
   #@concurso = Concurso.new(concurso_params)
    img = params[:concurso][:concurso]
    #@archivo.video = vid.original_filename

    upload_imagen(img)

    respond_to do |format|
      if @concurso.save
        format.html { redirect_to @concurso, notice: 'El Concurso fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @concurso }
      else
        format.html { render :new }
        format.json { render json: @concurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concursos/1
  # PATCH/PUT /concursos/1.json
  def update
    respond_to do |format|
      if @concurso.update(concurso_params)
        format.html { redirect_to @concurso, notice: 'Concurso was successfully updated.' }
        format.json { render :show, status: :ok, location: @concurso }
      else
        format.html { render :edit }
        format.json { render json: @concurso.errors, status: :unprocessable_entity }
      end
    end
  end

   

  # DELETE /concursos/1
  # DELETE /concursos/1.json
  def destroy
    @concurso.destroy
    respond_to do |format|
      format.html { redirect_to concursos_url, notice: 'Concurso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload_imagen(file)
    # Declaring
    uploader = ImagenUploader.new
    # Upload it
    uploader.store!(file)
    return uploader.url
    end

  private
    # Use callbacks to share common setup or constraints between actions.
   
   def archivo_params
      params.require(:archivo).permit(:nombres, :email, :video, :mensaje, :fecha_creacion, :estado, :concurso_url)

      end
    # Never trust parameters from the scary internet, only allow the white list through.
    def concurso_params
      params.require(:concurso).permit(:namec, :banner, :url, :fecha_inicio, :fecha_fin, :premio)
    end
    
      def set_concurso
     @concurso = Concurso.find(params[:url])
   end

 #   def validate_user
  #    redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
  #  end
end
