##
# FEDSF
#

# setup client authentication
certstore = CZTop::CertStore.new
dim.nodes[:self].subnodes.each do |node|
  cert = CZTop::Certificate.new_from(node.pubkey)
  certstore.insert(cert)
end
authenticator = CZTop::Authenticator.new(certstore)

# start the server sockets
server_cert = CZTop::Certificate.load("/path/to/private_key")
pub = CZTop::Socket::PUB.new
pub.CURVE_server!(server_cert)

dim.nodes[:self].subnodes.each do |node|
  pub.connect(node.sub_endpoint)
end

# TODO: same for PULL
# TODO: same for ROUTER
