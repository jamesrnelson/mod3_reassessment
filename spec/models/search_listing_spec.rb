require 'rails_helper'

describe SearchListing do
  subject { SearchListing.new('Denver') }
  it 'exists' do
    expect(subject).to be_a SearchListing
  end

  context 'instance methods' do
    it '#top_cuisines', vcr: true do
      subject.top_cuisines.each do |cuisine|
        expect(cuisine).to be_a Cuisine
      end
    end
  end
end
