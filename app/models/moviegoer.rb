class Moviegoer < ActiveRecord::Base
	has_many :reviews
	has_many :movies, through: :reviews

	attr_protected :uid, :provider, :name

	# def self.create_with_omniauth(auth)
	# 	Moviegoer.create!(
	# 		provider: auth["provider"],
	# 		uid: 			auth["uid"],
	# 		name: 		auth["info"]["name"]
	# 	)
	# end

	def self.from_omniauth(auth)
		where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
		end	
	end	
end
