class EsquemasController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def delete
  end

  def new
    database = Database.find_by_id(params[:id])
    @esquema = database.esquemas.new
  end
  
  def create
    params.permit!
    Database.create(params[:esquema])
    redirect_to(:action => 'show', :id => @database.id)
  end
end
