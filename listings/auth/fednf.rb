# load certificates
server_cert = CZTop::Certificate.new_from host.local_node.supernode.pubkey
client_cert = CZTop::Certificate.load '/path/to/client_private_key'

##
# connect the three client sockets
#
endpoints = host.local_node.supernode.endpoints

sub = CZTop::Socket::SUB.new
sub.CURVE_client! client_cert, server_cert
sub.connect endpoints[:sub]

push = CZTop::Socket::PUSH.new
push.CURVE_client! client_cert, server_cert
push.connect endpoints[:push]

dealer = CZTop::Socket::DEALER.new
dealer.CURVE_client! client_cert, server_cert
dealer.connect endpoints[:dealer]
