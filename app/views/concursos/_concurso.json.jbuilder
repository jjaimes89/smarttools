json.extract! concurso, :id, :namec, :banner, :url, :fecha_inicio, :fecha_fin, :premio, :created_at, :updated_at
json.url concurso_url(concurso, format: :json)