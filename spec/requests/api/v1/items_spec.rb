require 'rails_helper'

describe 'get request to api/v1/items' do
  it 'should respond with a 200 and all items' do

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
        'id': item1.id,
        'name': item1.name,
        'description': item1.description,
        'image_url': item1.image_url
      },
      {
        'id': item2.id,
        'name': item2.name,
        'description': item2.description,
        'image_url': item2.image_url
      }
    ]

    # And each item has an id, name, description, and image_url but not the created_at or updated_at

    # When I send a GET request to `/api/v1/items`
    get '/api/v1/items'

    expect(response).to be_success
    # I receive a 200 JSON response containing all items

    items = JSON.parse(response.body, symbolize_names: true)
    expect(items).to eq(expected)
  end
end

describe 'get request /api/v1/items/:id' do
  it 'should respond with info about that specific item' do
    item1 = Item.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
    )

    get "/api/v1/items/#{item1.id}"

    # When I send a GET request to `/api/v1/items/1`
    expected = {
        'id': item1.id,
        'name': item1.name,
        'description': item1.description,
        'image_url': item1.image_url
      }
    expect(response).to be_success

    item = JSON.parse(response.body, symbolize_names: true)
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(item).to eq(expected)
  end
end
