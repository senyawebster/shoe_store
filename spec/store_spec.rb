require 'spec_helper'

describe(Store) do
  it { should have_and_belong_to_many(:shoes)}

  it("validates presence of store name") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end

  it("validates store name no longer than 100 characters") do
    store = Store.new({:name => "A store name that is way too long"*(10)})
    expect(store.save()).to(eq(false))
  end

  # it("validates presence of description") do
  #   store = Store.new({:name => ""})
  #   expect(store.save()).to(eq(false))
  # end
end
