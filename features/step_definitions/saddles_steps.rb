require 'coderay'
module SH
  def some
    3
  end

  def peek
    print CodeRay.scan(page.body, :html).term
  end

  def submit_form
    find('input[@name="commit"]').click
  end

  def should_see_success_message
    expect(page.find('.alerts .alert-success').text.strip).to_not be_blank
  end
end
World SH

module SaddleSH
  def add_saddle(attrs={})
    saddle = default_saddle.merge(attrs)
    visit new_saddle_path
    select saddle[:manufacturer], from: Manufacturer
    fill_in 'Model', with: saddle[:model]
    submit_form
  end

  def create_saddle
    Saddle.create({model: "Wibble"})
  end

  def default_saddle
    {
      manufacturer: default_manufacturer[:name],
      model: 'Arione'
    }
  end

  def saddle_should_be_added
    expect(page).to have_css('.saddle')
    should_see_success_message
  end
end
World SaddleSH

Given(/^there are some saddles$/) do
  some.times do create_saddle; end
end

When(/^I view saddles$/) do
  visit saddles_path
end

Then(/^I should see some saddles$/) do
  expect(page).to have_css '.saddles .saddle', count: some
end

When(/^I add a saddle$/) do
  add_saddle
end

Then(/^a saddle should be added$/) do
  saddle_should_be_added
end

