require 'rails_helper'

describe SearchListing do
  subject { SearchListing.new("Denver") }

  it 'exists' do
    expect(subject).to be_a SearchListing
  end

  context 'instance methods' do
    context '#city_search' do
      it 'returns an array of hashes of city cuisine data', vcr: true do
        raw_search = subject.city_search.first

      end
    end
  end
end
