# encoding: utf-8

require 'spec_helper'

RSpec.describe TTY::Prompt::Question, '#validate' do
  let(:input)  { StringIO.new }
  let(:output) { StringIO.new }
  let(:prompt)  { TTY::Prompt.new(input, output) }

  it 'fails to validate input' do
    input << 'piotrmurach'
    input.rewind
    q = prompt.ask("What is your username?").validate(/^[^\.]+\.[^\.]+/)
    expect { q.read_string }.to raise_error(ArgumentError)
  end

  it 'validates input with regex' do
    input << 'piotr.murach'
    input.rewind
    q = prompt.ask("What is your username?").validate(/^[^\.]+\.[^\.]+/)
    expect(q.read_string).to eq('piotr.murach')
  end

  it 'validates input in block' do
    input << 'piotr.murach'
    input.rewind
    q = prompt.ask("What is your username?").validate { |arg| arg =~ /^[^\.]+\.[^\.]+/ }
    expect(q.read_string).to eq('piotr.murach')
  end
end
