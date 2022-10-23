require 'digest'

class AuthController < ApplicationController
  def index
  end

  def login
    username = params[:username]
    password = params[:password]

    if username.blank? || password.blank?
      render 'index'
      return
    end

    password_md5 = Digest::MD5.hexdigest(password)

    # query = Admin.where(username: username, password: password_md5)
    # @raw_sql = query.to_sql
    # admin = query.first
    # if admin.present?
    #   @result = "Login success: #{admin.username}"
    # end
    # @result = "#{username} #{password_md5}"

    sql = "SELECT * FROM admins WHERE username='#{username}' AND password='#{password_md5}' LIMIT 1;"
    record = ActiveRecord::Base.connection.execute(sql)
    @debug = record
    @raw_sql = sql
    @result = record.present? ? "Login success: #{record.first['username']}" : "Login failed"

    render 'index'
  end
end