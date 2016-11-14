class Concurso < ApplicationRecord
belongs_to :user
validates :namec, presence: true
validates :url, uniqueness: true, presence: true
validates :banner, presence: true
validates :premio, presence: true

	self.primary_key = "url"	
	def to_param
    url.parameterize
  end

  

has_many :archivos

extend CarrierWave::Mount
	mount_uploader :banner, ImagenUploader
	
end
