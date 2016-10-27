Feature: Federation
  In order to communicate with the rest of the federation
  As a Roadster federation node
  I need to be able to deduce who I am, who are the others,
  and how can I contact my neighbors.

  Scenario: Topology loading
    Given a static configuration file defining the federation topology
    When a node starts
    Then configuration will be loaded.

  Scenario: Role loading
    Given a static configuration file defining the role for each node
    When a node starts
    Then the CORE actor starts the appropriate other actors.
