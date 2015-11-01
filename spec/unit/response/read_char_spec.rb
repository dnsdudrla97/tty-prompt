# encoding: utf-8

require 'spec_helper'

RSpec.describe TTY::Prompt::Question, '#read_char' do
  let(:input)  { StringIO.new }
  let(:output) { StringIO.new }
  let(:prompt) { TTY::Prompt.new(input, output) }

  it 'reads single character' do
    input << "abcde"
    input.rewind
    q = prompt.ask("What is your favourite letter?")
    expect(q.read_char).to eql "a"
  end
end
