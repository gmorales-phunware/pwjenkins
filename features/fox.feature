Feature: FOX
  In order to perform a task on a particular platform
  As a CLI
  I want to be as objective as possible

  Scenario: FOX, or FOX?
    When I run `pwkenkins FOX -all`
    Then the output should contain "Building with -all flag"
