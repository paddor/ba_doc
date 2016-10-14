Feature: DIM extension
  In order to keep the DIM synchronized across the federation
  As a Roadster federation node
  I need to replicate DIM updates across the federation and vice versa

  Background:
    Given a federation topology configuration available on all nodes
    And subnodes S1, S2 have a network link to root node R
    And nodes S1, S2 are running

  Scenario: Initial DIM synchronization
    Given root node R starts
    When connections between subnodes and the root node have been established
    Then synchronization between the pairs (S1,R), (S2,R) happens bidirectionally
    And the DIM is eventually synchronized across all nodes S1, S2, R

  Scenario: Continuous DIM synchronization
    Given root node R is running
    And connections between subnodes and root node are established
    When the DIM is updated on node S1
    Then the update is eventually replicated across the remaining nodes S2, R

  Scenario: Access control
    Given that every element in the DIM is owned by exactly one node
    When replicating an update to a DIM element originating from its owning node
    Then all other nodes verify that the update originates from its owning node
    And unverifiable updates are discarded
