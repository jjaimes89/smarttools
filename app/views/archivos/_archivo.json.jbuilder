json.extract! archivo, :id, :nombres, :apellidos, :email, :video, :mensaje, :estado, :created_at, :updated_at
json.url archivo_url(archivo, format: :json)