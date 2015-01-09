require 'spec_helper'

class FlowerboxTest
  has test: :String, hoge: :Fixnum
end

describe Flowerbox do
  it 'has a version number' do
    expect(Flowerbox::VERSION).not_to be nil
  end

  it 'does something useful' do
    t = FlowerboxTest.new
    t.test = "test"
    expect(t.test).to eq "test"
    expect { t.test = 1000 }.to raise_error TypeConstraints::Exceptions::Invalid

    t.hoge = 100
    expect(t.hoge).to eq 100
    expect { t.hoge = "hoge" }.to raise_error TypeConstraints::Exceptions::Invalid
  end
end
