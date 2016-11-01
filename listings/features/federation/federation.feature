Feature: Federation
  In order to communicate with the rest of the federation
  As a Roadster federation node
  I need to be able to deduce who I am, who are the others,
  and how can I contact my neighbors.

  Scenario: Configuration loading
   Given a configuration defining the federation topology and node roles
   When a node starts
   Then configuration will be loaded
   And the CORE actor starts the appropriate other actors
   And the node knows its place in the federation
   And the node knows how to contact its neighboring nodes
