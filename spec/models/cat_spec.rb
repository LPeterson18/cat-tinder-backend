require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'should have a valid name' do
    cat = Cat.create(age: 7, enjoys: 'sleeping in boxes', profile_pic: 'cat.jpg')
    expect(cat.errors[:name]).to include "can't be blank"
  end
  it 'should have a valid age' do
    cat = Cat.create(name: 'Whiskers', enjoys: 'sleeping in boxes', profile_pic: 'cat.jpg')
    expect(cat.errors[:age]).to include "can't be blank"
  end
  it 'should have a valid enjoys' do
    cat = Cat.create(name: 'whiskers', age: 7, profile_pic: 'cat.jpg')
    expect(cat.errors[:enjoys]).to include "can't be blank"
  end
  it 'should have a valid profile_pic' do
    cat = Cat.create(name: 'Whiskers', age: 7, enjoys: 'sleeping in boxes')
    expect(cat.errors[:profile_pic]).to include "can't be blank"
  end
  it 'should have an enjoys of at least 10 characters long' do
    cat = Cat.create(name: 'Whiskers', age: 7, enjoys: 'sleeping', profile_pic: 'cat.jpg')
    expect(cat.errors[:enjoys]).to include "is too short (minimum is 10 characters)"
  end
end
