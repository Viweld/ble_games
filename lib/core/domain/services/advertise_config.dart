class AdvertiseConfig {
  final String? serviceUuid;
  final int? manufacturerId;
  final List<int>? manufacturerData;
  final bool connectable;

  const AdvertiseConfig({
    this.serviceUuid,
    this.manufacturerId,
    this.manufacturerData,
    this.connectable = true,
  });
}
