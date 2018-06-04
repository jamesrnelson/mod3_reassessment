require 'rails_helper'

describe SearchListing do
  subject { SearchListing.new('Denver') }
  it 'exists' do
    expect(subject).to be_a SearchListing
  end
end
