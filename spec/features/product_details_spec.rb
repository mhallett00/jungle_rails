require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do
  
  #SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click on a product and see the product details" do
    # ACT
    visit root_path
    find('article.product img', match: :first).click

    # VERIFY
    expect(page).to have_css 'img.main-img'
    
    # DEBUG
    save_screenshot("products_details.png")

  end
end
