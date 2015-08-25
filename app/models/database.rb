class Database < ActiveRecord::Base
  belongs_to :servidor
  has_many :esquemas, :dependent => :destroy
end
