class EncryptController < ApplicationController

  include EncryptHelper

  def rot19
    render :json => {:status => :error, :message => t('limit_error')}, :status => 500 and return if session[:encrypt_count].to_i > 5

    session[:encrypt_count] ||= 0
    session[:encrypt_count] += 1

    render :json => {:status => :ok, :value => rot(params[:text], 19), :count => t('limit_message', :count => session[:encrypt_count], :limit => 5)}
  end
end
