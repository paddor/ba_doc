Feature: Persistence synchronization
  In order to collection and allow aggregation of persisted data
  As a Roadster federation node
  I need to be able to inform my supernode about changes to persisted data.

  Background:
    Given a federation of multiple hierarchy levels
    And the current node has a supernode

  Scenario: Initialization persistence synchronization
    When the connection is established to the supernode
    And the supernode initiates the persisted data synchronization
    Then the current node sends the delta of the persisted data to the supernode.

  Scenario: Continuous persistence synchronization
    Given the current node has a connection to the supernode established
    And the initial persistence synchronization is done
    When there is a change in the persisted data
    Then the current node sends the update to the supernode
    And the supernode persists the received update.

  Scenario: Persistence synchronization after link failure recovery
    When the connection is re-established between supernode and current node
    Then persistence synchronization is re-initialized.

