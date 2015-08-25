class EsquemasController < InheritedResources::Base
  def index
  end

  def show
    @esquema = Esquema.find_by_id(params[:id])
     @database = @esquema.database
  end

  def edit
    @esquema = Esquema.find_by_id(params[:id])
    @database = @esquema.database
  end

  def delete
    @esquema = Esquema.find_by_id(params[:id])
    @esquema.destroy!
    redirect_to(:controller => 'databases', :action => 'show', :id => params[:database_id])
  end


  def new
    @database = Database.find_by_id(params[:id])
    @esquema = @database.esquemas.new
  end
  
  def create
    params.permit!
    x = Esquema.create(params[:esquema])
    redirect_to(:controller => 'databases', :action => 'show', :id => x.database_id)
  end
  
  def update
        params.permit!
    @esquema = Esquema.find_by_id(params[:id])
    if @esquema.update_attributes(params[:esquema])
      
      redirect_to(:controller => 'databases', :action => 'show', :id => @esquema.database_id)
      flash[:notice] = "Esquema updated."
    else
      @section_count = @page.sections.size
      render('edit')
    end
  end
  
end
