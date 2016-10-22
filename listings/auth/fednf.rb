# load certificates
server_cert = CZTop::Certificate.new_from(dim.nodes[:self].parent.pubkey)
client_cert = CZTop::Certificate.load("/path/to/client_private_key")

##
# connect the three client sockets
#

sub = CZTop::Socket::SUB.new
sub.CURVE_client!(client_cert, server_cert)
sub.connect(dim.nodes[:self].parent.pub_endpoint)

push = CZTop::Socket::PUSH.new
push.CURVE_client!(client_cert, server_cert)
push.connect(dim.nodes[:self].parent.push_endpoint)

dealer = CZTop::Socket::DEALER.new
dealer.CURVE_client!(client_cert, server_cert)
dealer.connect(dim.nodes[:self].parent.dealer_endpoint)
