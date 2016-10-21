##
# FEDNF
#
server_cert = CZTop::Certificate.new_from(dim.nodes[:self].parent.pubkey)
client_cert = CZTop::Certificate.load("/path/to/client_private_key")

sub = CZTop::Socket::SUB.new
sub.CURVE_client!(client_cert, server_cert)
sub.bind("tcp://*:1234")

# TODO: same for PUSH
# TODO: same for DEALER
