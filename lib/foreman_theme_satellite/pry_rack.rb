module ForemanThemeSatellite
  class PryRack
    def initialize(app)
      @app = app
    end

    def call(env)
       binding.pry
       @app.call(env)
     end
   end
end
