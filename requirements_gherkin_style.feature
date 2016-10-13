Feature: Federation
	//TODO
	
	Scenario: Configuration is loaded
		Given a configuration available on all nodes
		When nodes are starting
		Then configuration will be loaded
		
Feature: DIM Synchronization
	//TODO
	Background:
		Given a configuration available on all nodes
		And subnodes A, B have a network link to a root node R	
		And nodes A, B Are running

	Scenario: DIM Synchronization at start
		Given root node R starts
		When connections between subnodes and root node are established
		Then synchronization between the pairs (A,R), (B,R) happens bidirectionally
		And the DIM is eventually synchronized across all nodes A, B, R
	
	Scenario: continuous DIM Synchronization
		Given root node R is running
		And connections between subnodes and root node are established
		When the DIM is updated on node A
		Then the update is eventually replicated across the remaining nodes B, R
	
	Scenario: DIM Synchronization after link failure recovery
		Given root node is running
		And connection between subnode A and root node R are established
		And network link between pair (B, R) is down
		When network link between pair (B, R) recovers
		Then synchronization between the pairs (B,R) happens bidirectionally

Feature: Command Routing
	//TODO 
	
	Background:
		Given a configuration available on all nodes
		And subnodes A, B have a network link to a root node R	
		And nodes A, B Are running
		
	Scenario: Send command from R to B
		Given user is logged in on the R UI
		When User sends a commend from the R UI to B Node
		Then Commend routed throug the Nodes to B
		And commend will be executed on Node B