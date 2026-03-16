import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repository/location/location_repository.dart';
import 'package:blabla/model/ride/locations.dart';

class LocationRepositoryMock implements LocationRepository {
  @override
  Future<List<Location>> getAvailableLocation() async {
    return fakeLocations;
  }
}
