require 'rails_helper'

describe SearchListingService do
  subject { SearchListingService.new("Denver") }

  it 'exists' do
    expect(subject).to be_a SearchListingService
  end

  context 'instance methods' do
    context '#city_search' do
      it 'returns an array of hashes of city names and ids', vcr: true do
        raw_search = subject.city_search

      end
    end

    context '#city_id' do
      it 'returns the correct_id', vcr: true do
        expect(subject.city_id).to eq(305)
      end
    end

    context '#top_cuisines_search' do
      it 'returns an array of hashes of cuisines', vcr: true do
        raw_search = subject.top_cuisines_search
        expect(raw_search.first[:cuisine][:cuisine_name]).to eq('Afghani')
      end
    end
  end
end
