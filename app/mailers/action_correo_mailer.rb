class ActionCorreoMailer < ApplicationMailer
    default from: "j.jaimes@uniandes.edu.co"

    def video_convertido_email(v)
  	    @video= v
    mail(to: @video.email, subject: 'Video exitosamente convertido')
    end
end
