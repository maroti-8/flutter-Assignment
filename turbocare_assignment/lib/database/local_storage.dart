import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:turbocare_assignment/models/vehicle.dart';

class LocalStorage {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> writeSecureData(Vehicle newItem) async {
    await _secureStorage.write(
        key: newItem.vehicleNumber,
        value: Vehicle.serialize(newItem),
        aOptions: _getAndroidOptions());
  }

  Future<Vehicle?> readSecureData(String key) async {
    String? data =
        await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    if (data != null) {
      var readData = Vehicle.deserialize(data);
      return readData;
    } else {
      return null;
    }
  }

  Future<List<Vehicle>> readAllSecureData() async {
    var allData = await _secureStorage.readAll(aOptions: _getAndroidOptions());
    List<Vehicle> list =
        allData.entries.map((e) => Vehicle.deserialize(e.value)).toList();
    return list;
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
