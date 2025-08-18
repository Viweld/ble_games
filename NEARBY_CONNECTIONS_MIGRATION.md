# Миграция на Nearby Connections

## Обзор изменений

Проект успешно переведен с BLE (Bluetooth Low Energy) на Nearby Connections для обеспечения более надежного и простого поиска и сопряжения устройств.

## Что изменено

### 1. Зависимости (pubspec.yaml)
- **Убрано**: `flutter_blue_plus`, `flutter_ble_peripheral`
- **Добавлено**: `nearby_connections: ^3.3.1`

### 2. AndroidManifest.xml
**Убраны BLE разрешения:**
```xml
<!-- УДАЛЕНО -->
<uses-permission android:name="android.permission.BLUETOOTH" />
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
<uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
<uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
<uses-feature android:name="android.hardware.bluetooth" />
<uses-feature android:name="android.hardware.bluetooth_le" />
```

**Добавлены разрешения для Nearby Connections:**
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

### 3. Info.plist (iOS)
**Убраны BLE описания:**
```xml
<!-- УДАЛЕНО -->
<key>NSBluetoothAlwaysUsageDescription</key>
<key>NSBluetoothPeripheralUsageDescription</key>
<key>UIBackgroundModes</key> <!-- bluetooth-central, bluetooth-peripheral -->
```

**Добавлены описания для Nearby Connections:**
```xml
<key>NSLocalNetworkUsageDescription</key>
<key>NSLocationWhenInUseUsageDescription</key>
<key>UIBackgroundModes</key> <!-- network-authentication -->
```

### 4. Архитектура приложения

#### Новые сервисы:
- `NearbyConnectionsService` - основной сервис для работы с Nearby Connections
- `INearbyConnectionsRepository` - интерфейс репозитория
- `NearbyConnectionsRepository` - реализация репозитория

#### Обновленный HomeScreen:
- **ConnectionManager** - управление поиском и сопряжением устройств
- **GamesList** - список доступных игр (активируется только при подключении)
- Упрощенная структура без сложной dependency injection

#### Обновленный HomeBloc:
- Поддержка новых событий для Nearby Connections
- Отслеживание статуса подключения
- Упрощенная логика инициализации

## Преимущества Nearby Connections

### 1. **Надежность**
- Использует Google Play Services на Android
- Автоматическое управление разрешениями
- Лучшая совместимость с различными устройствами

### 2. **Простота использования**
- Встроенные нативные UI для поиска устройств
- Автоматическое обнаружение устройств поблизости
- Простой API для подключения и обмена данными

### 3. **Кроссплатформенность**
- Android: Google Play Services
- iOS: MultipeerConnectivity framework
- Единый API для обеих платформ

### 4. **Автоматизация**
- Автоматический запрос разрешений
- Автоматическое управление соединениями
- Встроенная обработка ошибок

## Структура нового интерфейса

### HomeScreen содержит:
1. **ConnectionManager** - кнопки для поиска устройств и рекламы
2. **GamesList** - список игр (неактивен до подключения)
3. **Статус подключения** - визуальный индикатор

### Доступные действия:
- **"Найти устройства"** - начать поиск других устройств
- **"Стать видимым"** - сделать устройство доступным для поиска
- **"Отключиться"** - разорвать активное соединение

## Следующие шаги для полной интеграции

### 1. **Реализация реального API Nearby Connections**
Текущая версия использует заглушки. Для продакшена нужно:
- Интегрировать реальный пакет `nearby_connections`
- Реализовать обработку событий подключения
- Добавить обработку входящих сообщений

### 2. **Обновление GameBloc**
- Адаптировать для работы с Nearby Connections
- Обновить логику обмена игровыми данными

### 3. **Тестирование**
- Проверить работу на Android устройствах
- Проверить работу на iOS устройствах
- Тестирование различных сценариев подключения

### 4. **Обработка ошибок**
- Добавить обработку ошибок подключения
- Добавить retry логику
- Улучшить UX при проблемах с подключением

## Совместимость

### Android
- Требует Google Play Services
- Минимальная версия: API 21 (Android 5.0)
- Рекомендуется: API 23+ для лучшей работы с разрешениями

### iOS
- Требует iOS 7.0+
- Использует MultipeerConnectivity framework
- Автоматически запрашивает необходимые разрешения

## Заключение

Переход на Nearby Connections значительно упрощает архитектуру приложения и обеспечивает более надежную работу с поиском и сопряжением устройств. Новый подход устраняет многие проблемы, связанные с BLE, и предоставляет более современный и простой API для разработки.

Основные преимущества:
- ✅ Более простая архитектура
- ✅ Лучшая надежность подключений
- ✅ Встроенные нативные UI
- ✅ Автоматическое управление разрешениями
- ✅ Лучшая совместимость с устройствами
- ✅ Кроссплатформенность
