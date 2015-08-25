class NetValidationsController < ApplicationController
 
  def index
    host = (params[:ip])
    @ipp = host
    
    pt = system("ping #{host}")
    if pt == true 
      puts "Ping Exitoso"
      @status = "Ping Exitoso!"
    else
      puts "Fallo" 
      @status = "Fallo"
    end
  end
  
end
