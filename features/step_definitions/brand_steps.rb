module BrandSH
  def create_brands(attrs={})
    some_brands.each do |man|
      create_brand(man)
    end
  end

  def create_brand(man)
    Brand.create(man)
  end

  def default_brand
    { name: 'Fizik' }
  end

  def some_brands
    [
      default_brand,
      { name: 'Specialized' },
      { name: 'Selle Italia '}
    ]
  end
end
World BrandSH



Given(/^there are some brands$/) do
  create_brands
end

When(/^I view brands$/) do
  visit brands_path
end

Then(/^I should see some brands$/) do
  expect(page).to have_css '.brands'
end


