import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repository/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';

class RideRepositoryMock implements RideRepository {
  @override
  Future<List<Ride>> getAllRides() async {
    return fakeRides;
  }
}
