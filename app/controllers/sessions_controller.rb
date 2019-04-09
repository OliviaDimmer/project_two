class SessionsController < ApplicationController
  protect_from_forgery except: :create
  def create
    # @provider_hash = request.env['omniauth.auth'].to_json
      omni = request.env['omniauth.auth']
      @student = Student.find_or_create_by(uid: omni['uid']) do |student|
        student.firstname = omni['info']['name']
        student.nickname = omni['info']['nickname']
        student.email = omni['info']['email']
      end
  end
end