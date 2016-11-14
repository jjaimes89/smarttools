class ArchivosController < ApplicationController
require 'mongoid'
require 'will_paginate/collection'
require 'carrierwave/mongoid'

  before_action :set_concurso, excep: [:show, :create]
  before_action :set_archivo, only: [:show, :edit, :update, :destroy]

  # GET /archivos
  # GET /archivos.json
  def index
    @archivos = Archivo.all
  end

  # GET /archivos/1
  # GET /archivos/1.json
  def show

    @archivo = Archivo.new
  #@archivos = Concurso.archivos.paginate(:page => params[:page], :per_page => 1)
  #@concurso = Concurso.new(params[:concurso_url])
  #@archivo.concurso= @concurso
  #@archivo = Archivo.new(archivo_params)
  
  end

  # GET /archivos/new
  def new
    @archivo = Archivo.new
  end

  # GET /archivos/1/edit
  def edit
  end

  # POST /archivos
  # POST /archivos.json
  def create

    @concurso= Concurso.find(params[:concurso_url])
    @archivo = Archivo.new(archivo_params)
    @archivo.concurso= @concurso
    vid = params[:archivo][:video]
    @archivo.nombre_video = vid.original_filename
    @archivo.estado = 0
    

   
    respond_to do |format|

      if @archivo.save
        format.html { redirect_to @archivo.concurso, notice: 'Su video fue subido exitosamente.' }
        format.json { render :show, status: :created, location: @archivo }
	send_msg_to_queue(@archivo.id.to_s)
	upload_file(@archivo)      
else
        format.html {  redirect_to @archivo.concurso, notice: 'Su video no se pudo subir, verifique los datos.' }
        format.json { render json: @archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archivos/1
  # PATCH/PUT /archivos/1.json
  def update
    respond_to do |format|
      if @archivo.update(archivo_params)
        format.html { redirect_to @concurso, notice: 'Archivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @archivo }
      else
        format.html { render :edit }
        format.json { render json: @archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archivos/1
  # DELETE /archivos/1.json
  def destroy
    @archivo.destroy
    respond_to do |format|
      format.html { redirect_to concursos_url, notice: 'Archivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 

  def upload_file(file)
    # Declaring
    uploader = VideoUploader.new
    # Upload it
    uploader.store!(file)
    return uploader.url
end

  private
    # Use callbacks to share common setup or constraints between actions.
  


    # Never trust parameters from the scary internet, only allow the white list through.
    def archivo_params
      params.require(:archivo).permit(:nombres, :email, :video, :mensaje, :estado, :concurso_id)

      end

 #     def validate_concurso
  #    redirect_to @concurso, notice: 'Selecciona un Concurso' 
  #    end

      def url_concurso
      redirect_to @concurso, notice: 'Selecciona un Concurso' 
      end

     def set_concurso
      @concurso = Concurso.find(params[:concurso_url])
	end

     def set_archivo
      @archivo = Archivo.find(params[:id])
    end
end
