# setup client authentication
certstore = CZTop::CertStore.new
host.local_node.subnodes.each do |node|
  cert = CZTop::Certificate.new_from node.pubkey
  certstore.insert cert
end
authenticator = CZTop::Authenticator.new certstore

# load private key
server_cert = CZTop::Certificate.load '/path/to/private_key'

##
# bind the three server sockets
#
endpoints = host.local_node.endpoints

pub = CZTop::Socket::PUB.new
pub.CURVE_server! server_cert
pub.bind endpoints[:pub]

pull = CZTop::Socket::PULL.new
pull.CURVE_server! server_cert
pull.bind endpoints[:pull]

router = CZTop::Socket::ROUTER.new
router.CURVE_server! server_cert
router.bind endpoints[:router]
