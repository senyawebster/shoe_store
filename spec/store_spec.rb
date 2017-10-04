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

  it("validates unique store name") do
    Store.create({:name => "Store Name"})
    store = Store.new({:name => "Store Name"})
    expect(store.save()).to(eq(false))
  end

  it("capitalizes store name") do
    store = Store.new({:name => "place"})
    store.save()
    expect(store.name).to(eq("Place"))
  end

end
