class BaseMailer < ActionMailer::Base

# esto es para el mailer del devise

	protected

	def mail_with_bcc(headers={}, &block)
		headers.merge!(:bcc => 'modulo@xxxmail.com')
		mail_without_bcc(headers, &block)
	end
	alias_method_chain :mail, :bcc

end