// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint
// coverage:ignore-start

import 'dart:collection';

import 'package:flutter/widgets.dart';

// **************************************************************************
// DepGen code generator
// **************************************************************************

import 'package:shared_preferences/shared_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:batuga/features/tictactoe/data/models/game_move_dto.dart'
    as game_move_dto;
import 'package:batuga/core/data/dto/user_dto.dart';
import 'package:batuga/core/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dep_gen/dep_gen.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:batuga/core/di/builders.dep_gen.dart';
import 'package:batuga/core/domain/services/i_bluetooth_state_service.dart';
import 'package:flutter/services.dart';
import 'package:batuga/core/domain/repositories/i_user_repository.dart';
import 'package:batuga/core/domain/services/bluetooth_manager/i_bluetooth_manager.dart';
import 'package:batuga/core/domain/services/i_bluetooth_permissions_service.dart';
import 'package:batuga/core/domain/services/i_bluetooth_state_service.dart';
import 'package:batuga/features/games_list/presentation/bloc/games_list_bloc.dart';
import 'package:batuga/features/home/presentation/bloc/home_bloc.dart';
import 'package:batuga/features/home/presentation/widgets/nickname_dialog/bloc/nickname_bloc.dart';
import 'package:batuga/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:batuga/features/tictactoe/presentation/bloc/game_bloc.dart';

/// The environment in which all used dependency instances are configured
@immutable
class DepGenEnvironment {
  DepGenEnvironment({Map<Type, Object>? initialServices})
    : _environment = initialServices ?? {};

  late final Map<Type, Object> _environment;

  // ---------------------------------------------------------------------------
  /// An unsafe method for getting an instance by its type. You need to be sure
  /// that an instance of the requested type has been registered
  T g<T>() => _environment[T] as T;

  // ---------------------------------------------------------------------------
  /// A safe method for trying to get an instance by its type.
  T? mayBeGet<T>() => _environment.containsKey(T) ? _environment[T] as T : null;

  // ---------------------------------------------------------------------------
  /// Registration of an instance with an indication of its type. You cannot
  /// register multiple instances of the same type
  void registry<T>(Object instance) => _environment[T] = instance;

  // ---------------------------------------------------------------------------
  /// Is the collection of instances blocked
  bool get isLocked => _environment is UnmodifiableMapView;

  // ---------------------------------------------------------------------------
  /// Returns an instance of the environment settings with the collection
  /// blocked from changes
  DepGenEnvironment lock() {
    return DepGenEnvironment(initialServices: Map.unmodifiable(_environment));
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
extension DepProviderContextExtension on BuildContext {
  /// Obtain a value from the nearest ancestor DepProvider.
  DepProvider depGen() => DepProvider.of(this);
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class DepProvider extends InheritedWidget {
  const DepProvider({
    Key? key,
    required Widget child,
    required DepGenEnvironment environment,
  }) : _env = environment,
       super(key: key, child: child);

  // ---------------------------------------------------------------------------
  /// A pre-configured environment containing the dependencies used
  final DepGenEnvironment _env;
  DepGenEnvironment get environment => _env;

  // ---------------------------------------------------------------------------
  static DepProvider of(BuildContext context) {
    final DepProvider? dp = context
        .findAncestorWidgetOfExactType<DepProvider>();
    if (dp == null) {
      throw UnimplementedError('DepProvider is not initialized in context');
    }
    return dp;
  }

  // ---------------------------------------------------------------------------
  @override
  bool updateShouldNotify(DepProvider oldWidget) {
    return false;
  }

  // ---------------------------------------------------------------------------
  /// An unsafe method for getting an instance by its type. You need to be sure
  /// that an instance of the requested type has been registered
  T g<T>() => _env.g<T>();

  // ---------------------------------------------------------------------------
  /// A safe method for trying to get an instance by its type.
  T? mayBeGet<T>() => _env.mayBeGet<T>();

  // ---------------------------------------------------------------------------
  GamesListBloc buildGamesListBloc() => GamesListBloc();

  // ---------------------------------------------------------------------------
  HomeBloc buildHomeBloc() => HomeBloc(
    playerRepository: _env.g<IUserRepository>(),
    bluetoothRepository: _env.g<IBluetoothManager>(),
  );

  // ---------------------------------------------------------------------------
  NicknameBloc buildNicknameBloc() => NicknameBloc();

  // ---------------------------------------------------------------------------
  SplashBloc buildSplashBloc() => SplashBloc(
    bluetoothManager: _env.g<IBluetoothManager>(),
    bluetoothPermissionsService: _env.g<IBluetoothPermissionsService>(),
    bluetoothStateService: _env.g<IBluetoothStateService>(),
  );

  // ---------------------------------------------------------------------------
  GameBloc buildGameBloc() => GameBloc(
    bluetoothRepository: _env.g<IBluetoothManager>(),
    userRepository: _env.g<IUserRepository>(),
  );
}

// coverage:ignore-end
