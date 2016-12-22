Feature: Encryption
	In order to achieve secure network communication
	As a Roadster federation node
	I need to be able to encrypt inter-node traffic

Scenario: Sending an encrypted message from one node to an other
	Given a federation topology configuration available on all nodes
	And public keys are distributed
	And subnodes S1, S2 have a network link to root node R
	And nodes S1, S2, R are running
	When node S1 data across the network to node R
	Then the inter-node traffic is encrypted
