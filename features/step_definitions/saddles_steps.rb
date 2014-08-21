require 'coderay'
module SH
  def some
    3
  end

  def peek
    print CodeRay.scan(page.body, :html).term
  end
end
World SH

module SaddleSH
  def create_saddle
    Saddle.create(default_saddle)
  end

  def default_saddle
    {
      manufacturer: 'Fizik',
      model: 'Arione'
    }
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

