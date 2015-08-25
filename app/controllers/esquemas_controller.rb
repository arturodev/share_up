class EsquemasController < InheritedResources::Base
  def index
  end

  def show
    @esquema = Esquema.find_by_id(params[:id])
     @database = @esquema.database
  end

  def edit
  end

  def delete
    @esquema = Esquema.find_by_id(params[:id])
    @esquema.destroy!
    redirect_to(:controller => 'databases', :action => 'show', :id => params[:database_id])
  end


  def new
    database = Database.find_by_id(params[:id])
    @esquema = database.esquemas.new
  end
  
  def create
    params.permit!
    x = Esquema.create(params[:esquema])
    redirect_to(:controller => 'databases', :action => 'show', :id => x.database_id)
  end
end
