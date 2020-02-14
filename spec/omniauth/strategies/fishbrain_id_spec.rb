# frozen_string_literal: true

require 'spec_helper'

describe OmniAuth::Strategies::FishbrainId do
  subject { described_class.new({}) }

  context 'client options' do
    it 'has correct name' do
      expect(subject.options.name).to eq('fishbrain_id')
    end
  end
end
