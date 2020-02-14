# frozen_string_literal: true

require 'spec_helper'

describe OmniAuth::Strategies::Fishbrain do
  subject { described_class.new({}) }

  context 'client options' do
    it 'has correct name' do
      expect(subject.options.name).to eq('fishbrain')
    end
  end
end
