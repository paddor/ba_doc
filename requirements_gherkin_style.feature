Feature: Federation
	In order to communicate between the federation
	As a roadster federation member
	I need to be able to know who I am and who are they others

	Scenario: Configuration loading
		Given a static configuration file available on all nodes
		When nodes are starting
		Then configuration will be loaded in each actor
		
Feature: DIM Synchronization
	In order to keep the DIM synced between the federation
	As a roadster federation system
	I need to be able to get actual DIM from each node
	
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
	In order to control other federation members field devices
	As a roadster federation member
	I need to be able to send commands from one federation to an other	

	Background:
		Given a configuration available on all nodes
		And subnode A has a network link to a root node R
		And nodes A, R are running
		
	Scenario: Send command from R to A
		Given user is logged in on the R UI
		When User sends a command from the R UI to A
		Then Command is routed to A
		And command is executed on node A