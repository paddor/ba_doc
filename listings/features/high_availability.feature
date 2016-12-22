Feature: High availability
	In order to achieve high availability
	As a Roadster federation node
	I need to be able to define a node pair primary and backup,
	communicate with my peer node,
	and failover on crash

	Background:
		Given two peer nodes P1 (primary) and P2 (backup)
		And network equipment connecting P1 and P2
		And a static configuration file defining the HA cluster

	Scenario: Healthy startup
		When starting the nodes P1 and P2
		Then primary node becomes active
		And backup node becomes passive

	Scenario: Unhealthy startup
		When starting the nodes P1 and P2
		And either P1 or P2 crashes or is otherwise unreachable
		Then the other node does not simply take over
		But generates an alarm - root seems dead

	Scenario: Active node crashes
		Given a healthily running HA cluster
		And a client connected to the active peer
		When active node crashes or becomes otherwise unreachable
		And client connects to passive node (fallback)
		Then the failover is initiated
		And the passive node becomes the active node
		And an alarm is generated

	Scenario: Passive node crashes
		Given a healthily running HA cluster
		When passive node crashes or becomes otherwise unreachable
		Then active node continues to operate normally
		And generates an alarm - backup root seems dead
