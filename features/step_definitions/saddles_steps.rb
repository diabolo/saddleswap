module SaddleSH
  def add_saddle(attrs={})
    fill_in_saddle_details
    submit_form
  end

  def add_saddle_with_image(attrs={})
    fill_in_saddle_details
    add_image
    submit_form
  end

  def fill_in_saddle_details(attrs={})
    saddle = default_saddle.merge(attrs)
    visit new_saddle_path
    select saddle[:brand], from: Brand
    fill_in 'Model', with: saddle[:model]
  end

  def add_image
    attach_file :saddle_image, attachment
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
    expect(page).to have_css '.image img'
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

When "I add a saddle with an image" do
  add_saddle_with_image
end

Then(/^a saddle should be added$/) do
  saddle_should_be_added
end

