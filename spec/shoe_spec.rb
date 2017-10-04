require 'spec_helper'

describe(Shoe) do
  it { should have_and_belong_to_many(:stores)}

  it("validates presence of store brand") do
    shoe = Shoe.new({:brand => ""})
    expect(shoe.save()).to(eq(false))
  end

  it("validates brand name no longer than 100 characters") do
    shoe = Shoe.new({:brand => "A store name that is way too long"*(10)})
    expect(shoe.save()).to(eq(false))
  end

  # it("validates presence of description") do
  #   shoe = Shoe.new({:description => ""})
  #   expect(shoe.save()).to(eq(false))
  # end
end
