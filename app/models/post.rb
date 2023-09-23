# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  attachments :json
#  body        :text
#  existencia  :integer
#  image       :string
#  precio      :integer          default(0)
#  publicado   :boolean          default(FALSE)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Post < ApplicationRecord

	mount_uploader :image, ImageUploader
  mount_uploaders :attachments, ImageUploader


	validates :title, presence: true, length: {minimum: 2}
	validates :body, presence: true
	validates :existencia, presence: true

	def en_dolares
		self.precio.to_f / 100
	end

	def en_bolivares
		self.precio * $dolar / 100
	end

	def publicado?
		self.publicado ? 'Publicado' : 'No publicado'
	end

end
