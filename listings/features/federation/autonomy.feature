Feature: Autonomy
  In order for each node to run independently
  As a Roadster federation node
  I need to be able to queue DIM updates and replicate them after recovery

  Background:
    Given a federation topology configuration available on all nodes
    And subnodes S1 and S2 have a network link to root node R
    And nodes S1, S2, R are running

  Scenario: DIM synchronization after link failure recovery
    Given root node is running
    And connection between subnode S1 and root node R are established
    And network link between pair (S2, R) is down
    When network link between pair (S2, R) recovers
    Then synchronization between the pairs (S2,R) happens bidirectionally
    And eventually the DIM is synced across all nodes
