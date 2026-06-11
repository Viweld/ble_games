import 'package:ble_peer_session/ble_peer_session.dart';

import '../domain/models/user.dart';

PeerEndpoint buildPeerEndpoint({
  required User user,
  required Device device,
}) {
  return PeerEndpoint(
    identity: PeerIdentity(id: user.id, displayName: user.name),
    device: device,
  );
}

User userFromPeerIdentity(PeerIdentity identity) {
  return User(id: identity.id, name: identity.displayName);
}
