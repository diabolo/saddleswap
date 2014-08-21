
module SH
  def some
    3
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
      model: 'Arione',
    }
    end
end
World SaddleSH

Given(/^there are some saddles$/) do
  some.times do create_saddle; end
end

When(/^I view saddles$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see some saddles$/) do
    pending # express the regexp above with the code you wish you had
end

