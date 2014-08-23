module ManufacturerSH
  def create_manufacturers(attrs={})
    some_manufacturers.each do |man|
      create_manufacturer(man)
    end
  end

  def create_manufacturer(man)
    Manufacturer.create(man)
  end

  def default_manufacturer
    { name: 'Fizik' }
  end

  def some_manufacturers
    [
      default_manufacturer,
      { name: 'Specialized' },
      { name: 'Selle Italia '}
    ]
  end
end
World ManufacturerSH



Given(/^there are some manufacturers$/) do
  create_manufacturers
end

When(/^I view manufacturers$/) do
  visit manufacturers_path
end

Then(/^I should see some manufacturers$/) do
  expect(page).to have_css '.manufacturers'
end


