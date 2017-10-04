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

  it("validates unique brand name") do
    Shoe.create({:brand => "Nike"})
    shoe = Shoe.new({:brand => "Nike"})
    expect(shoe.save()).to(eq(false))
  end

  it("capitalizes shoe brand") do
    shoe = Shoe.new({:brand => "nike"})
    shoe.save()
    expect(shoe.brand).to(eq("Nike"))
  end
end
