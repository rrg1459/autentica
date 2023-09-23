module ApplicationHelper

  def verifica_imagen(enlace)
    File.exists?('public' + enlace)
  end

  def colorea(publicado)
  	publicado ? 'color: blue': 'color: red'
  end


end
