
class Concurso
include Mongoid::Document
include Mongoid::Timestamps
include Mongoid::Slug

belongs_to :user
  field :namec, type: String, default: ""
  field :url, type: String
  field :banner, type: String, default: ""
  field :premio, type: String, default: ""
  field :fecha_inicio, type: Date
  field :fecha_fin, type: Date
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
  field :user_id, type: String

  slug :url

validates_presence_of :namec
validates_presence_of :url
validates_presence_of :premio
validates_uniqueness_of :url

has_many :archivos

extend CarrierWave::Mount
	mount_uploader :banner, ImagenUploader



#https://zisismaras.me/general/2015/09/17/mongodb-text-search-with-rails-and-mongoid.html
#http://railscasts.com/episodes/238-mongoid?language=es&view=asciicast
#https://github.com/mongoid/mongoid-slug

end