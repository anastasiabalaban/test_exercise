# frozen_string_literal: true

require 'rails_helper'

describe TestTasks::SortSizes do
  subject { described_class.call(size_set: data) }

  context 'with sort order type 1' do
    let(:data)   { ["L", "L/P", "M", "M/P", "S", "S/P", "XL", "XL/P", "XS", "XS/P"] }
    let(:result) { ["XS", "S", "M", "L", "XL", "XS/P", "S/P", "M/P", "L/P", "XL/P"] }

    it 'returns array in correct order' do
      is_expected.to eq(result)
    end
  end

  context 'with sort order type 2' do
    let(:data)   { ["0", "2", "8", "6", "4", "000", "00"] }
    let(:result) { ["000", "00", "0", "2", "4", "6", "8"] }

    it 'returns array in correct order' do
      is_expected.to eq(result)
    end
  end
end
