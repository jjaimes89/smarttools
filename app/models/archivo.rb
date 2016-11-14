class Archivo
include Mongoid::Document
include Mongoid::Timestamps

belongs_to :concurso

  
  field :nombres, type: String
  field :email, type: String
  field :video, type: String
  field :mensaje, type: String
  field :estado, type: String
  field :concurso_id, type: String
  field :fecha_conversion, type: Date
  field :ruta_conv, type: String
  field :nombre_video, type: String
  field :created_at, type: DateTime
  field :updated_at, type: DateTime

validates :nombres, presence: true
validates :email, presence: true
validates :video, presence: true
validates :mensaje, presence: true


extend CarrierWave::Mount
	mount_uploader :video, VideoUploader
 
index({ videoid: 1, label: -1 })

end
