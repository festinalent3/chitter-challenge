class Chitter < Sinatra::Base
  register Sinatra::Partial
  register Sinatra::Flash
  use Rack::MethodOverride

  set :partial_template_engine, :erb
  enable :sessions
  enable :partial_underscores

  # start the server if ruby file executed directly (not... !)
  # run! if app_file == $0

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end