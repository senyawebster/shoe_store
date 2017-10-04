require 'spec_helper'

describe(Store) do
  it { should have_and_belong_to_many(:shoes)}

  it("validates presence of store name") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end

  # it("validates presence of description") do
  #   store = Store.new({:description => ""})
  #   expect(store.save()).to(eq(false))
  # end
  #
  # it("validates presence of description") do
  #   store = Store.new({:description => ""})
  #   expect(store.save()).to(eq(false))
  # end
end
