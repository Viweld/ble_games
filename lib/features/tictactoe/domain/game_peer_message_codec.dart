import 'package:ble_peer_session/ble_peer_session.dart';

import 'models/enums/player_type.dart';
import 'models/game_move.dart';
import 'models/game_position.dart';

abstract final class GamePeerMessageTypes {
  static const move = 'game.move';
  static const roleAssignment = 'game.role_assignment';
  static const opponentLeft = 'game.opponent_left';
}

PeerMessage encodeMoveMessage({
  required PeerEndpoint peerEndpoint,
  required GameMove move,
}) {
  return PeerMessage(
    peerEndpoint: peerEndpoint,
    type: GamePeerMessageTypes.move,
    payload: {
      'row': move.position.row,
      'column': move.position.column,
      'player_type': move.playerType.name,
    },
  );
}

GameMove? decodeMoveMessage(PeerMessage message) {
  if (message.type != GamePeerMessageTypes.move) return null;
  final payload = message.payload;
  if (payload == null) return null;
  final playerName = payload['player_type'] as String? ?? PlayerType.x.name;
  return GameMove(
    position: GamePosition(
      row: payload['row'] as int,
      column: payload['column'] as int,
    ),
    playerType: PlayerType.values.firstWhere(
      (e) => e.name == playerName,
      orElse: () => PlayerType.x,
    ),
  );
}

bool isOpponentLeftMessage(TransportMessage message) {
  return message is PeerMessage &&
      message.type == GamePeerMessageTypes.opponentLeft;
}
