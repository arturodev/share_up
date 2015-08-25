class ServidoresController < InheritedResources::Base
  
  
  
  def list
     @servidor = Servidor.order("servidors.hostname ASC")
  end



  def show
    @servidor = Servidor.find_by_id(params[:id])
    @dbs = @servidor.databases
  end



  def edit
    @servidor = Servidor.find_by_id(params[:id])
  end

  def update
    params.permit!
    @servidor = Servidor.find_by_id(params[:id])
    if @servidor.update_attributes(params[:servidor])
      
      redirect_to(:action => 'show', :id => @servidor.id)
      flash[:notice] = "Section updated."
    else
      @section_count = @page.sections.size
      render('edit')
    end
  end
  

  def new
    @servidor = Servidor.new
  end
  
  
  
  def create
    params.permit!
    @servidor = Servidor.new(params[:servidor])
    if @servidor.save
      flash[:notice] = "Subject created."
      redirect_to(:action => 'list')
    else
      render('new')
    end
  end
 
  def delete
    @servidor = Servidor.find_by_id(params[:id])
    @servidor.destroy!
    redirect_to :action => :list
  end

  
end
