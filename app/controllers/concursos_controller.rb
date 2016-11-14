class ConcursosController < ApplicationController
require 'mongoid'
require 'will_paginate/collection'
require 'carrierwave/mongoid'

 
 before_action :authenticate_user!,  except: [:show, :index]
 before_action :set_concurso, except: [:index, :new, :create]
 

  def index
    @concursos = Concurso.paginate(:page => params[:page], :per_page => 10)
    end

  def show
 @archivos = @concurso.archivos.paginate(:page => params[:page], :per_page => 2)
 @archivo = Archivo.new
  end

  def new
    @concurso = Concurso.new
  end

  def edit
  end

  def create
 @concurso = current_user.concursos.new(concurso_params)
 # @concurso = Concurso.new(concurso_params)

   img = params[:concurso][:concurso]
   
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

   

  
  def destroy
    @concurso.destroy
    respond_to do |format|
      format.html { redirect_to concursos_url, notice: 'Concurso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload_imagen(file)
    uploader = ImagenUploader.new
    uploader.store!(file)
    return uploader.url
    end

  private
      
   def archivo_params
     #ok params.require(:archivo).permit(:nombres, :email, :video, :mensaje, :fecha_creacion, :estado, :concurso_url, :concurso_id)
      params.require(:archivo).permit(:nombres, :email, :video, :mensaje, :fecha_creacion, :estado, :concurso_id)
      end
    
    def concurso_params
      params.require(:concurso).permit(:namec, :banner, :url, :fecha_inicio, :fecha_fin, :premio, :user_id)
    end

     
      def set_concurso
    #@concurso = Concurso.find(params[:url])
    #@concurso = Concurso.find(params[:concurso_id])

    @concurso = Concurso.find_by(params[:concurso_id])

   end
end
