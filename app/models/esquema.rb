class Esquema < ActiveRecord::Base
  
  has_one :acceso
  belongs_to :database
end
