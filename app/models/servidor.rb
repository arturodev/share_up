class Servidor < ActiveRecord::Base
  has_many :databases, :dependent => :destroy
  has_many :sisoperativos
end
