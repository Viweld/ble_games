import 'i_bluetooth_advertising.dart';
import 'i_bluetooth_connection.dart';
import 'i_bluetooth_discovery.dart';
import 'i_bluetooth_lifecycle.dart';

abstract interface class IBluetoothManager
    implements
        IBluetoothAdvertising,
        IBluetoothConnection,
        IBluetoothDiscovery,
        IBluetoothLifecycle {}
