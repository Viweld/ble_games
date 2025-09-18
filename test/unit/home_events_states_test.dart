import 'package:flutter_test/flutter_test.dart';
import 'package:batuga/features/home/presentation/bloc/events.dart';
import 'package:batuga/features/home/presentation/bloc/states.dart';
import 'package:batuga/core/domain/models/device.dart';

void main() {
  group('Home Events and States', () {
    group('Events', () {
      test('HomeEventOnInitializationRequested', () {
        const event = HomeEvent.onInitializationRequested();
        expect(event, const HomeEventOnInitializationRequested());
      });

      test('HomeEventOnStartAwaitingConnection', () {
        const event = HomeEvent.onStartAwaitingConnection();
        expect(event, const HomeEventOnStartAwaitingConnection());
      });

      test('HomeEventOnStartSearchingDevices', () {
        const event = HomeEvent.onStartSearchingDevices();
        expect(event, const HomeEventOnStartSearchingDevices());
      });

      test('HomeEventOnDeviceSelected', () {
        final device = Device(id: 'test_id', name: 'Test Device');
        final event = HomeEvent.onDeviceSelected(device: device);
        expect(event, HomeEventOnDeviceSelected(device: device));
      });

      test('HomeEventOnSendMessage', () {
        const event = HomeEvent.onSendMessage(content: 'Test message');
        expect(event, const HomeEventOnSendMessage(content: 'Test message'));
      });
    });

    group('States', () {
      test('HomeStateInitializationPending', () {
        const state = HomeState.initializationPending();
        expect(state, const HomeStateInitializationPending());
      });

      test('HomeStateView', () {
        const state = HomeState.view();
        expect(state, const HomeStateView());
      });

      test('HomeStateAwaitingConnection', () {
        const state = HomeState.awaitingConnection();
        expect(state, const HomeStateAwaitingConnection());
      });

      test('HomeStateSearchingDevices', () {
        const state = HomeState.searchingDevices(
          devices: [],
          selectedDevice: null,
        );
        expect(
          state,
          const HomeStateSearchingDevices(devices: [], selectedDevice: null),
        );
      });

      test('HomeStateMessageTestView', () {
        const state = HomeState.messageTestView();
        expect(state, const HomeStateMessageTestView());
      });
    });
  });
}
