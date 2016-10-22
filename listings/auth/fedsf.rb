# setup client authentication
certstore = CZTop::CertStore.new
dim.nodes[:self].subnodes.each do |node|
  cert = CZTop::Certificate.new_from(node.pubkey)
  certstore.insert(cert)
end
authenticator = CZTop::Authenticator.new(certstore)

# load private key
server_cert = CZTop::Certificate.load("/path/to/private_key")

##
# bind the three server sockets
#

pub = CZTop::Socket::PUB.new
pub.CURVE_server!(server_cert)
pub.bind(dim.nodes[:self].pub_endpoint)

pull = CZTop::Socket::PULL.new
pull.CURVE_server!(server_cert)
pull.bind(dim.nodes[:self].pull_endpoint)

router = CZTop::Socket::ROUTER.new
router.CURVE_server!(server_cert)
router.bind(dim.nodes[:self].router_endpoint)
