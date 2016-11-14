require 'aws/ses'
include ColaHelper

module VideosHelper
	def self.convert_videos  
		puts "entro al helper"
		
		puts "conectando con S3"
		connection = Fog::Storage.new({
			:provider		=>	'AWS',
			#:region			=> 'us-east-1',	
			:region			=> 'us-west-2',			
			:aws_access_key_id	=>	'AKIAI6C2BGIS5PPLPNKA',
			:aws_secret_access_key	=>	'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'
		})
		message_from_queue = obtain_message_from_queue[0]
		if message_from_queue
			puts "consultando video por id"
			#@video = Archivo.find_by_id(message_from_queue.body)
			@video = Archivo.find(message_from_queue.body)
			puts "video: " + @video.id
			directory = connection.directories.get("smartools-videosd")
			puts directory
			#for video in @videos
				puts @video.video
				#video_a_convertir = Rails.root.join("public", "uploads", "#{video.class.to_s.underscore}", video.nombre_video)
				video_a_convertir = @video.video
				puts video_a_convertir
				movie = FFMPEG::Movie.new(video_a_convertir.to_s)
				puts "cargo el video a convertir ..."
				ruta_convertidos = Rails.root.join("public", "uploads", "#{@video.class.to_s.underscore}", "convertidos")
				FileUtils.mkdir_p(ruta_convertidos) unless File.exists?(ruta_convertidos)
				video_convertido = Rails.root.join("public", "uploads", "#{@video.class.to_s.underscore}", "convertidos", "#{@video.id}"+".mp4")
				puts "valido la ruta ..."
				options = {video_codec: "libx264", audio_codec: "aac", custom: %w(-strict -2)}
				movie.transcode(video_convertido.to_s, options){ |progress| puts progress } 
				puts "termino la conversion ..."
				
				ruta_storage = "/uploads/convertidos"
				# Guardando informacion en el storage
				if File.exists?(video_convertido)
					puts "entro a guardar en S3"
					#Creando el directorio en S3
					directory = connection.directories.create(
						:key		=> "smartools-videosd#{ruta_storage}",
						:public		=> true
					)
					# Creating the file
					file = directory.files.create(
					:key		=> "#{@video.id}"+".mp4",
					:body		=> File.open(video_convertido),
					:public		=> true
					)
					puts "guardo en S3" 
					# Borrando archivos locales
					File.delete(video_convertido)
				end

				# actualizacion informacion base de datos
				@video.ruta_conv = "https://smartools-videosd.s3.amazonaws.com/uploads/convertidos/"+"#{@video.id}"+".mp4"
				
				@video.fecha_conversion = DateTime.now
				@video.estado = 1
				@video.save(:validate => false)
				puts "guardo la informacion en BD"

				#envio de correo
				ActionCorreoMailer.video_convertido_email(@video).deliver
				puts "envio el correo"

				#borrando registro de la cola
				delete_message_from_queue(message_from_queue.receipt_handle)
				puts "se borro reg de la cola"
			#end
		end
	end
end
