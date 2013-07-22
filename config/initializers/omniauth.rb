OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, "hyl8lKvWbFzCM0f3nKTg", "tYjlFQ8mOShXue7C6w2WknbpVsoFdEqKQsjvmyI1q8"
end