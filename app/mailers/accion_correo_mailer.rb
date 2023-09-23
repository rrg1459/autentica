class AccionCorreoMailer < ApplicationMailer
	default from: ENV["GMAIL_USER"]

end
