class Reptile < ApplicationRecord
	validates_presence_of :name, :birthday, :new_animal
end
