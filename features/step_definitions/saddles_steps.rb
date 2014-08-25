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
    expect(page.find(alert_success_finder).text.strip).to_not be_blank
  end

  def alert_success_finder
    #css to find the node containing the msg inside a success alert box
    '.alert-box.success .msg'
  end
end
World SH

module SaddleSH
  def add_saddle(attrs={})
    saddle = default_saddle.merge(attrs)
    visit new_saddle_path
    select saddle[:brand], from: Brand
    fill_in 'Model', with: saddle[:model]
    submit_form
  end

  def create_saddle
    Saddle.create({model: "Wibble"})
  end

  def default_saddle
    {
      brand: default_brand[:name],
      model: 'Arione'
    }
  end

  def saddle_should_be_added
    expect(page).to have_css('.saddle')
    should_see_success_message
    should_see_saddle_details
  end

  def should_see_saddle_details
    expect(page.find('.model').text.strip).to_not be_blank
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

