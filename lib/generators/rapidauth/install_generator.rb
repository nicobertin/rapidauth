module Rapidauth
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    def create_models
      template "user.rb", "app/models/user.rb"
    end

    def create_views
      directory "views", "app/views"
    end

    def create_controllers
      directory "controllers", "app/controllers"
    end

    def create_jobs
      directory "jobs", "app/jobs"
    end

    def create_mailers
      directory "mailers", "app/mailers"
    end

    def create_config
      template "rapidauth.rb", "config/initializers/rapidauth.rb"
    end

    def create_routes
      route "resources :sessions, only: [:new, :create, :destroy]"
      route "resources :registrations, only: [:new, :create]"
      route "resources :password_resets, only: [:new, :create, :edit, :update]"
      route "resources :confirmations, only: [:new, :create]"
    end
  end
end
