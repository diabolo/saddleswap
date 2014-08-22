module ManufacturerSH
  def create_manufacturers(attrs={})
    some_manufacturers.each do |man|
      create_manufacturer(man)
    end
  end

  def create_manufacturer(man)
    Manufacturer.create(man)
  end

  def some_manufacturers
    [
      { name: 'Fizik' },
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


