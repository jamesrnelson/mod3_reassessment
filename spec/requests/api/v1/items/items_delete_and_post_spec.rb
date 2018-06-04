require 'rails_helper'

describe 'delete request to /api/v1/items/:id' do
  it 'should delete the specified record' do
    item1 = Item.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
    )
    item2 = Item.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      image_url: "http://robohash.org/2.png?set=set2&bgset=bg1&size=200x200"
    )

    expected = [
      {
        'id': item2.id,
        'name': item2.name,
        'description': item2.description,
        'image_url': item2.image_url
      }
    ]

    delete '/api/v1/items/1'

    expect(response.status).to eq(204)

    # When I send a DELETE request to `/api/v1/items/1` I receive a 204 JSON response if the record is successfully deleted

    get '/api/v1/items'

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to eq(expected)
  end
end

describe 'post request to /api/v1/items' do
  it 'should be able to post' do
    
  end
end
