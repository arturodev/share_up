class Servidor < ActiveRecord::Base
  has_many :databases
  has_many :sisoperativos
end
