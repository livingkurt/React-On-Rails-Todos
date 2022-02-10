# frozen_string_literal: true

class AppController < ApplicationController
  layout "app"

  def index
    @app_props = { name: "Stranger" }
  end
end
