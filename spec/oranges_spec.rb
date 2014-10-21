require_relative '../lib/oranges'
require 'spec_helper'

describe OrangeTree do
  let(:orange_tree) { OrangeTree.new }

  it 'starts with an age of 0' do
    expect(orange_tree.age).to eq 0
  end

  it 'starts with an height of 0' do
    expect(orange_tree.height).to eq 0
  end

  it 'increases age by one when we call age!' do
    orange_tree.age!

    expect(orange_tree.age).to eq 1
  end

  it 'can be aged two times' do
    age_by_years(2)

    expect(orange_tree.age).to eq 2
  end

  it 'grows 2 feet each year' do
    orange_tree.age!
    
    expect(orange_tree.height).to eq 2
  end

  it 'dies after it reaches its lifespan' do
    age_by_years(15)

    expect(orange_tree.send(:dead?)).to eq true
  end

  it 'only has oranges' do
    expect(orange_tree.oranges).to eq []
  end

  it 'is empty for the first two years' do
    age_by_years(2)

    expect(orange_tree.oranges).to be_empty
  end

  it 'starts growing trees on its third year' do
    age_by_years(3)

    all_oranges?(orange_tree)
  end


  it 'can be picked' do
    age_by_years(3)
    orange_tree.oranges.pick!

    expect(orange_tree.oranges.count).to eq 2
  end

  private

  def all_oranges?(orange_tree)
    orange_tree.oranges.each do |orange|
      expect(orange).to be_an_instance_of(Orange)
    end
  end

  def age_by_years(number_of_years)
    number_of_years.times { orange_tree.age! }
  end
end
