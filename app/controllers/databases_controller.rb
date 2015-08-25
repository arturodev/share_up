class DatabasesController < InheritedResources::Base
  def list
  end

  def index
    #AQui ya no usarias ningun metodo ...
    #a menos que necesites unavariable diferente a database oks 
  end

  def edit
    @database = Database.find_by_id(params[:id])
  end

  def show
    @database = Database.find_by_id(params[:id])
    @esquemas = @database.esquemas
  end

  def update
    params.permit!
    @database = Database.find_by_id(params[:id])
    if @database.update_attributes(params[:database]) #database nombre del modelo OO
      flash[:notice] = "Section updated."
      redirect_to(:action => 'show', :id => @database.id)  
    else
      @section_count = @page.sections.size
      render('edit')
    end  
  end

  def new
    @servidor = Servidor.find_by_id(params[:id])
    @database = @servidor.databases.new
  end

  def create
    params.permit!
    @database = Database.new(params[:database])
    if @database.save
      flash[:notice] = "Subject created."
      redirect_to(:controller => 'servidores', :action => 'show', :id => @database.servidor_id)
    else
      render('new')
    end
  end
  
  def delete
    database = Database.find_by_id(params[:id])
    database.destroy
    redirect_to(:controller => 'servidores', :action => 'show', :id => params[:servidor_id])
  end
end
