require 'spec_helper'

class ScottieTest
  has test: :String, hoge: :Fixnum
end

describe Scottie do
  it 'has a version number' do
    expect(Scottie::VERSION).not_to be nil
  end

  it 'does something useful' do
    t = ScottieTest.new
    t.test = "test"
    expect(t.test).to eq "test"
    expect { t.test = 1000 }.to raise_error TypeConstraints::Exceptions::Invalid

    t.hoge = 100
    expect(t.hoge).to eq 100
    expect { t.hoge = "hoge" }.to raise_error TypeConstraints::Exceptions::Invalid
  end
end
