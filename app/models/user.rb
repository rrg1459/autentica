# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  apellido               :string           default(""), not null
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  f_ultima_actividad     :datetime
#  google_refresh_token   :string
#  google_token           :string
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_type        :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  nombre                 :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invited_by_id          :integer
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_invitation_token      (invitation_token) UNIQUE
#  index_users_on_invitations_count     (invitations_count)
#  index_users_on_invited_by_id         (invited_by_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord

	attr_accessor :login

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :invitable, :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable, :confirmable

	validates :nombre, presence: { message: "en blanco" },
	length: { minimum: 3, :message => "Mínimo 3 caracteres" }

	validates :apellido, presence: { message: "en blanco" },
	length: { minimum: 3, :message => "Mínimo 3 caracteres" }

	validates :username, presence: { message: "Usuario en blanco" },
	length: { maximum: 8,  :message => "Máximo 8 caracteres para el usuario" },
	:uniqueness => { case_sensitive: false, message: "Usuario ya existe, por favor intente con otro usuario" }

	def self.find_for_database_authentication(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		else
			where(conditions).first
		end
	end

def self.from_omniauth(auth)
		# Creates a new user only if it doesn't exist
		where(email: auth.info.email).first_or_initialize do |user|
			user.nombre = auth.info.name
			user.email  = auth.info.email
		end
	end

end
