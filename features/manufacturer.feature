Feature: Manufacturer
  As a user
  I want to see a list of manufacturers of saddles
  So I can narrow the list of saddles I see

  Scenario: View manufacturers
    Given there are some manufacturers
    When I view manufacturers
    Then I should see some manufacturers
