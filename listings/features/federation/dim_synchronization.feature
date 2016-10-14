Feature: DIM synchronization
  In order to keep the DIM synchronized across the federation
  As a Roadster federation
  I need to replicate DIM updates across the federation and vice versa

  Background:
    Given a federation topology configuration available on all nodes
    And subnodes S1, S2 have a network link to root node R
    And nodes S1, S2 Are running

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
