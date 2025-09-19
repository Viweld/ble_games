import 'package:flutter_test/flutter_test.dart';
import 'package:batuga/features/home/presentation/bloc/home_bloc.dart';
import 'package:batuga/core/domain/models/device.dart';

void main() {
  group('Home Events and States', () {
    group('Events', () {
      test('HomeEventOnInitializationRequested', () {
        const event = HomeEvent.onInitializationRequested();
        expect(event, const HomeEvent.onInitializationRequested());
      });

      test('HomeEventOnStartAwaitingConnection', () {
        const event = HomeEvent.onStartAwaitingConnection();
        expect(event, const HomeEvent.onStartAwaitingConnection());
      });

      test('HomeEventOnStartSearchingDevices', () {
        const event = HomeEvent.onStartSearchingDevices();
        expect(event, const HomeEvent.onStartSearchingDevices());
      });

      test('HomeEventOnDeviceSelected', () {
        final device = Device(id: 'test_id', name: 'Test Device');
        final event = HomeEvent.onDeviceSelected(device: device);
        expect(event, HomeEvent.onDeviceSelected(device: device));
      });

      test('HomeEventOnSendMessage', () {
        const event = HomeEvent.onSendMessage(content: 'Test message');
        expect(event, const HomeEvent.onSendMessage(content: 'Test message'));
      });
    });

    group('States', () {
      test('HomeStateInitializationPending', () {
        const state = HomeState.initializationPending();
        expect(state, const HomeState.initializationPending());
      });

      test('HomeStateView', () {
        const state = HomeState.view();
        expect(state, const HomeState.view());
      });

      test('HomeStateAwaitingConnection', () {
        const state = HomeState.awaitingConnection();
        expect(state, const HomeState.awaitingConnection());
      });

      test('HomeStateSearchingDevices', () {
        const state = HomeState.searchingDevices(
          devices: [],
          selectedDevice: null,
        );
        expect(
          state,
          const HomeState.searchingDevices(devices: [], selectedDevice: null),
        );
      });

      test('HomeStateMessageTestView', () {
        const state = HomeState.messageTestView();
        expect(state, const HomeState.messageTestView());
      });
    });
  });
}
