Feature: Add a saddle
  As a ? (wouldn't it be good if users could add saddle, then they would do all the work)
  I want to be able to add a saddle
  So that people can swap a saddle


  Background:
    Given there are some brands

  Scenario: Add a saddle
    When I add a saddle
    Then a saddle should be added

    @wip
  Scenario: Add a saddle with an image
    When I add a saddle with an image
    Then a saddle should be added


