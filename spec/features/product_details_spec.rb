require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They select a product and view product page" do
    # ACT
    visit root_path
    #fire click
    first('article.product').click_link('Details')
    
    # DEBUG / VERIFY
    expect(page).to have_css 'section.products-show', count: 1
    save_screenshot("product_page.png")
    puts page.html
  end
end
