# encoding: UTF-8

%w(action_controller/railtie coderay).map(&method(:require))
#%w(action_controller/railtie coderay).map{|f| require f}

run TheMinimizeRailsApp ||= Class.new(Rails::Application){
  config.secret_token = routes.append{ root to: "hello#world" }.inspect
  initialize!
}

class HelloController < ActionController::Base
  def world
    render :inline => "
      <!DOCTYPE html>
      <html>
        <head>
          <title>The minimize Rails App</title>
        </head>
        <body>
          <b>&#x0488;学&#x0489;好&#x0489;数&#x0489;理&#x0489;化&#x0488;</b>
          <h3>I am the minimize rails app!</h3>
          <p>Here is my source code:</p>
          #{CodeRay.scan_file(__FILE__, :ruby).div(line_numbers: :table)}          
        </body>
      </html>
    "
  end
end