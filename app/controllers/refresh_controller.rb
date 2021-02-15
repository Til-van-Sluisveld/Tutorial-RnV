class RefreshController < ApplicationController
  before_action :authorize_acces_request!

  def create 
    session = JWTSessions::Session.new(payload: claimless_payload, refresh_by_access_allowed: true)
    tokens = session.refresh_by_acces_allowed do
      raise JWTSession::Error:: Unauthorized, "Somethings not right here!"
    end

    response.set_cookie(JWTSessions.access_cookie,
    value: tokens[:access],
  httponly: true,
secure Rails.env.production?)
render json: { csrf: tokens[:csrf]}

  end
end
