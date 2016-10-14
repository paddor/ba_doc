Feature: Autonomy
  In order for each node to run independently
  As a Roadster federation node
  I need to be able to queue DIM updates and replicate them after recovery

  Background:
    Given a federation topology configuration available on all nodes
    And subnodes S1 and S2 have a network link to root node R
    And nodes S1, S2, R are running

  Scenario: Unreachable neighbor nodes
    When link to neighboring node fails or neighboring node crashes
    And neighboring node becomes unreachable
    Then node continues to perform its assigned tasks
    And field devices, if any, are still being monitored
    And updates to the DIM are still possible
    And data to persist, if any, is still being persisted
    And the node's web UI stays accessible and functional

  Scenario: DIM synchronization after link failure recovery
    Given root node is running
    And connection between subnode S1 and root node R are established
    And network link between pair (S2, R) is down
    When network link between pair (S2, R) recovers
    Then synchronization between the pairs (S2,R) happens bidirectionally
    And eventually the DIM is synced across all nodes
