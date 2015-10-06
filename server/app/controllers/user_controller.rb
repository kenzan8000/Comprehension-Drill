class UserController < ApplicationController

  protect_from_forgery :except => [:index]

=begin
  @apiVersion 0.1.0

  @apiGroup User
  @api {post} /user
  @apiName post user
  @apiDescription post user

  @apiParam {String} device_token               Mandatory device token for push notification
  @apiParam {String} language                   Mandatory language ex) en-us
  @apiParam {String} app_secret                 Mandatory an encrypted password to register user

  @apiParamExample {json} Request-Example:
    {
      "device_token": '',
      "language": 'en-us',
      "app_secret": 'hogefuga',
      "app_key": 'foobar'
    }

  @apiSuccess {Number} application_code 200:success 400:client error

  @apiSuccessExample {json} Success-Response:
    {
      "application_code": 200
    }
=end
  def index
    application_code = 200
    do_succeed = true

    # params
    device_token = params[:device_token]
    language = params[:language]
    app_secret = params[:app_secret]

    # check params
      # device_token
    do_succeed = false unless device_token
      # language
    do_succeed = false unless language
    if do_succeed
      do_succeed = false unless LanguageCode.find_by_name(language)
    end
      # app_secret
    do_succeed = false unless app_secret
    if do_succeed
      # AES-256-CBC
      encryption = YAML.load(File.read("#{Rails.root}/config/encryption.yml"))["#{Rails.env}"]
      cipher = OpenSSL::Cipher::Cipher.new('AES-256-CBC')
      cipher.decrypt
      cipher.key = encryption['key']
      cipher.iv = encryption['iv']
      begin
        do_succeed = false unless encryption['app_secret'] == (cipher.update(app_secret.unpack('m')[0]) + cipher.final)
      rescue
        do_succeed = false
      end
    end

    if !do_succeed
      application_code = 400
    elsif User.exists?(device_token: device_token) # update
    else # new record
    end

    # response
    json = Jbuilder.encode do |j|
      j.application_code application_code
    end
    render json: json
  end

end
