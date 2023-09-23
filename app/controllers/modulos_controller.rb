class ModulosController < ApplicationController

	# before_action :authenticate_user!

	def inicial
		@lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et.'
	end

	def generar_pdf
		@lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et.'
		hora = Time.now.strftime("%d%b%Y_%Hh%Mm%Ss")
		nombreArchivo = 'informe'
		respond_to do |format|
			format.html
			format.pdf do
				render pdf:"SUSTENTATOR_#{nombreArchivo}_#{hora}",
				margin:  {   
					top:              25,
					bottom:           25,
					left:             30,
					right:            30,
				},
				header:  {
					font_size:         7, 
					left: "#{Time.now.strftime("%d/%b/%Y %H:%M:%S")}",
					center: "SUSTENTATOR",
					right: '[page] de [topage]',
					spacing:           5,
				},
				footer: {
					font_size:         7, 
					spacing:           5,
					center: "#{root_url}"
				},
				:template => 'modulos/documento.pdf.erb',
				layout: 'pdf.html.erb',
				page_size: 'letter'
			end
		end
	end

end



