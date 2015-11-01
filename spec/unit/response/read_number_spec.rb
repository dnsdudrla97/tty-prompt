# encoding: utf-8

require 'spec_helper'

RSpec.describe TTY::Prompt::Question, '#read_numbers' do
  let(:input)  { StringIO.new }
  let(:output) { StringIO.new }
  let(:prompt) { TTY::Prompt.new(input, output) }

  it 'reads integer' do
    input << 35
    input.rewind
    q = prompt.ask("What temperature?")
    answer = q.read_int
    expect(answer).to be_kind_of Integer
    expect(answer).to eql 35
  end

  it 'reads float' do
    number = 6.666
    input << number
    input.rewind
    q = prompt.ask("How tall are you?")
    answer = q.read_float
    expect(answer).to be_kind_of Float
    expect(answer).to eql number
  end
end
