Feature: Brand
  As a user
  I want to see a list of brands of saddles
  So I can narrow the list of saddles I see

  Scenario: View brands
    Given there are some brands
    When I view brands
    Then I should see some brands
