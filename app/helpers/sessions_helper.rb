# frozen_string_literal: true

module SessionsHelper
  LOGIN_TYPE = %w[user staff].freeze

  LOGIN_TYPE.each do |type|
    define_method :"current_#{type}" do
      klass = Object.const_get(type.capitalize)
      if (id = session[:"#{type}_id"])
        if instance_variable_get(:"@current_#{type}").blank?
          instance_variable_set(:"@current_#{type}", klass.find_by(id: id))
        end
        instance_variable_get(:"@current_#{type}")
      elsif (id = cookies.signed[:"#{type}_id"])
        target = klass.find_by(id: id)
        if target&.authenticated?(cookies[:"#{type}_token"])
          send(:"#{type}_log_in", target)
          instance_variable_set(:"@current_#{type}", target)
        end
      end
    end

    define_method :"#{type}_logged_in?" do
      send("current_#{type}").present?
    end

    define_method :"authenticate_#{type}?" do
      redirect_to send(:"#{type}_login_path") unless send(:"#{type}_logged_in?")
    end

    define_method :"#{type}_log_in" do |target|
      session[:"#{type}_id"] = target.id
      send(:"#{type}_remember", target)
    end

    define_method :"#{type}_log_out" do
      send(:"#{type}_forget", send(:"current_#{type}"))
      session.delete(:"#{type}_id")
    end
  end

  private

  LOGIN_TYPE.each do |type|
    define_method :"#{type}_remember" do |target|
      target.send(:remember)
      cookies.permanent.signed[:"#{type}_id"] = target.id
      cookies.permanent[:"#{type}_token"] = target.remember_token
    end

    define_method :"#{type}_forget" do |target|
      target.send(:forget)
      cookies.delete(:"#{type}_id")
      cookies.delete(:"#{type}_token")
    end
  end
end
