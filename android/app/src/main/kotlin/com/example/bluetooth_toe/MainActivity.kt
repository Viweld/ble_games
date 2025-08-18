package com.example.bluetooth_toe

import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.bluetooth.BluetoothGattCharacteristic
import android.bluetooth.BluetoothGattDescriptor
import android.bluetooth.BluetoothGattServer
import android.bluetooth.BluetoothGattServerCallback
import android.bluetooth.BluetoothGattService
import android.bluetooth.le.AdvertiseCallback
import android.bluetooth.le.AdvertiseData
import android.bluetooth.le.AdvertiseSettings
import android.content.Context
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel
import java.util.UUID

class MainActivity : FlutterActivity() {
    private val channelName = "ble_advertiser"
    private val eventChannelName = "gatt_events"

    private var advertiseCallback: AdvertiseCallback? = null
    private var gattServer: BluetoothGattServer? = null
    private var gattEventsSink: EventChannel.EventSink? = null
    private var notifyCharacteristic: BluetoothGattCharacteristic? = null

    // UUIDs (must match Flutter)
    private val serviceUuid = UUID.fromString("0000a7c0-0000-1000-8000-00805f9b34fb")
    private val charNotifyUuid = UUID.fromString("0000a7c1-0000-1000-8000-00805f9b34fb")
    private val charWriteUuid = UUID.fromString("0000a7c2-0000-1000-8000-00805f9b34fb")
    private val cccdUuid = UUID.fromString("00002902-0000-1000-8000-00805f9b34fb")

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "isSupported" -> {
                        val supported = isBlePeripheralSupported()
                        result.success(supported)
                    }
                    "startLegacy" -> {
                        try {
                            val args = call.arguments as Map<*, *>
                            startLegacyAdvertising(args)
                            startGattServer()
                            result.success(null)
                        } catch (e: Exception) {
                            result.error("start_error", e.message, null)
                        }
                    }
                    "stop" -> {
                        stopAdvertising()
                        stopGattServer()
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, eventChannelName)
            .setStreamHandler(object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    gattEventsSink = events
                }

                override fun onCancel(arguments: Any?) {
                    gattEventsSink = null
                }
            })
    }

    private fun isBlePeripheralSupported(): Boolean {
        val manager = getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        val adapter = manager.adapter ?: return false
        return adapter.isEnabled && adapter.bluetoothLeAdvertiser != null
    }

    private fun startLegacyAdvertising(args: Map<*, *>) {
        val manager = getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        val adapter = manager.adapter ?: throw IllegalStateException("No BT adapter")
        val advertiser = adapter.bluetoothLeAdvertiser ?: throw IllegalStateException("No LE advertiser")

        stopAdvertising()

        val connectable = (args["connectable"] as? Boolean) ?: true
        val serviceUuid = args["serviceUuid"] as? String
        val manufacturerId = (args["manufacturerId"] as? Int)
        val manufacturerData = (args["manufacturerData"] as? List<*>)?.map { (it as Number).toByte() }?.toByteArray()

        val settings = AdvertiseSettings.Builder()
            .setAdvertiseMode(AdvertiseSettings.ADVERTISE_MODE_BALANCED)
            .setTxPowerLevel(AdvertiseSettings.ADVERTISE_TX_POWER_MEDIUM)
            .setConnectable(connectable)
            .build()

        val dataBuilder = AdvertiseData.Builder()
        // Ставим данные максимально совместимые с legacy кадрами
        if (!serviceUuid.isNullOrBlank()) {
            try {
                val pUuid = java.util.UUID.fromString(serviceUuid)
                dataBuilder.addServiceUuid(android.os.ParcelUuid(pUuid))
            } catch (_: Exception) {
            }
        }
        if (manufacturerId != null && manufacturerData != null) {
            dataBuilder.addManufacturerData(manufacturerId, manufacturerData)
        }
        // Не включаем имя устройства, чтобы уменьшить payload
        val data = dataBuilder.build()

        val cb = object : AdvertiseCallback() {}
        advertiseCallback = cb
        advertiser.startAdvertising(settings, data, cb)
    }

    private fun stopAdvertising() {
        try {
            val manager = getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
            val adapter = manager.adapter ?: return
            val advertiser = adapter.bluetoothLeAdvertiser ?: return
            advertiseCallback?.let { advertiser.stopAdvertising(it) }
            advertiseCallback = null
        } catch (_: Exception) {
        }
    }

    private fun startGattServer() {
        try {
            val manager = getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
            gattServer?.close()
            gattServer = manager.openGattServer(this, object : BluetoothGattServerCallback() {
                override fun onConnectionStateChange(device: android.bluetooth.BluetoothDevice?, status: Int, newState: Int) {
                    super.onConnectionStateChange(device, status, newState)
                }

                override fun onCharacteristicWriteRequest(
                    device: android.bluetooth.BluetoothDevice?,
                    requestId: Int,
                    characteristic: BluetoothGattCharacteristic?,
                    preparedWrite: Boolean,
                    responseNeeded: Boolean,
                    offset: Int,
                    value: ByteArray?
                ) {
                    super.onCharacteristicWriteRequest(device, requestId, characteristic, preparedWrite, responseNeeded, offset, value)
                    gattServer?.sendResponse(device, requestId, android.bluetooth.BluetoothGatt.GATT_SUCCESS, 0, null)
                    if (characteristic?.uuid == charWriteUuid && value != null) {
                        // Forward to Flutter as UTF-8 string
                        try {
                            val msg = String(value, Charsets.UTF_8)
                            gattEventsSink?.success(msg)
                        } catch (_: Exception) { }
                    }
                }

                override fun onDescriptorWriteRequest(
                    device: android.bluetooth.BluetoothDevice?,
                    requestId: Int,
                    descriptor: BluetoothGattDescriptor?,
                    preparedWrite: Boolean,
                    responseNeeded: Boolean,
                    offset: Int,
                    value: ByteArray?
                ) {
                    super.onDescriptorWriteRequest(device, requestId, descriptor, preparedWrite, responseNeeded, offset, value)
                    gattServer?.sendResponse(device, requestId, android.bluetooth.BluetoothGatt.GATT_SUCCESS, 0, null)
                }
            })

            val service = BluetoothGattService(serviceUuid, BluetoothGattService.SERVICE_TYPE_PRIMARY)

            // Notify characteristic
            val notifyChar = BluetoothGattCharacteristic(
                charNotifyUuid,
                BluetoothGattCharacteristic.PROPERTY_NOTIFY,
                BluetoothGattCharacteristic.PERMISSION_READ
            )
            val cccd = BluetoothGattDescriptor(
                cccdUuid,
                BluetoothGattDescriptor.PERMISSION_READ or BluetoothGattDescriptor.PERMISSION_WRITE
            )
            notifyChar.addDescriptor(cccd)
            notifyCharacteristic = notifyChar

            // Write characteristic
            val writeChar = BluetoothGattCharacteristic(
                charWriteUuid,
                BluetoothGattCharacteristic.PROPERTY_WRITE or BluetoothGattCharacteristic.PROPERTY_WRITE_NO_RESPONSE,
                BluetoothGattCharacteristic.PERMISSION_WRITE
            )

            service.addCharacteristic(notifyChar)
            service.addCharacteristic(writeChar)
            gattServer?.addService(service)
        } catch (_: Exception) {
        }
    }

    private fun stopGattServer() {
        try {
            gattServer?.close()
            gattServer = null
            notifyCharacteristic = null
        } catch (_: Exception) { }
    }
}
