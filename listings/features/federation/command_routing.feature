Feature: Command routing
  In order to make updates to parts of the DIM owned by other federation
  nodes, or interact with their field devices
  As a Roadster federation node
  I need to be able to send commands other nodes in the federation

  Background:
    Given a federation topology configuration available on all nodes
    And subnode S1 has a network link to root node R
    And nodes S1, R are running

  Scenario: Sending command from R to S1
    Given a user is logged in on the UI of node R
    When user sends changes a setting affecting node S1 directly
    Then a command is generated from in UI and routed to node S1
    And command is executed on node S1
