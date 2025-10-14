import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/core/config/.env.dev', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'APP_NAME')
  static String appName = _Env.appName;
  @EnviedField(varName: 'SERVICE_ID')
  static String serviceId = _Env.serviceId;
  @EnviedField(varName: 'CHARACTERISTIC_ID')
  static String characteristicId = _Env.characteristicId;
}
