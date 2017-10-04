class Store < ActiveRecord::Base
  has_and_belongs_to_many(:shoes)
  validates(:name, {:presence => true, :length => {:maximum => 100}})
  validates(:name, uniqueness: { case_sensitive: false })
  before_save(:upcase)

  private

  def upcase
    array = store.name.split
    array.each do |x|
      x.capitalize!
    end
    store.name = array.join(' ')
  end

end
