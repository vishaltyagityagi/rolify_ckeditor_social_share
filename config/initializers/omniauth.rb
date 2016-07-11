OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '878522108867669', '6609eb34ca13c5728192b3c9ecdaed59', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
