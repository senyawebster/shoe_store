class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand, {:presence => true, :length => {:maximum => 100}})
  validates(:brand, uniqueness: { case_sensitive: false })
  before_save(:upcase)

   #private

   def upcase
     array = self.brand.split
     array.each() do |x|
       x.capitalize!
     end
     binding.pry
     self.brand = array.join(' ')
   end

end
