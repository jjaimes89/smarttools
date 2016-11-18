
module VideosHelper
	def self.convert_videos  
		puts "entro al helper"
		@videos = Archivo.where(estado:0)
		for video in @videos
			puts video.video
			video_a_convertir = Rails.root.join("public", "uploads", "#{video.class.to_s.underscore}", video.nombre_video)
			puts video_a_convertir
			movie = FFMPEG::Movie.new(video_a_convertir.to_s)
			puts "cargo el video a convertir ..."
			ruta_convertidos = Rails.root.join("public", "uploads", "#{video.class.to_s.underscore}", "convertidos")
			FileUtils.mkdir_p(ruta_convertidos) unless File.exists?(ruta_convertidos)
			video_convertido = Rails.root.join("public", "uploads", "#{video.class.to_s.underscore}", "convertidos", "#{video.id}"+".mp4")
			puts "valido la ruta ..."
			options = {video_codec: "libx264", audio_codec: "aac", custom: %w(-strict -2)}
			movie.transcode(video_convertido.to_s, options){ |progress| puts progress } 
			puts "termino la conversion ..."
			
			# actualizacion informacion base de datos
			video.ruta_conv = "/uploads/archivo/convertidos/"+"#{video.id}"+".mp4"
			
			video.fecha_conversion = DateTime.now
			video.estado = 1
			video.save(:validate => false)
			puts "guardo la informacion en BD"
			
			#envio de correo
			ActionCorreoMailer.video_convertido_email(video).deliver
			puts "envio el correo"
		end
	end
end
