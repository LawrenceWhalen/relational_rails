#app/models/crystal.rb

class Crystal < ApplicationRecord
  belongs_to :crystal_set

  def self.show_only_true
    where(charged: "true")
  end

  def self.order_alphabetically
   order('name')
  end
end