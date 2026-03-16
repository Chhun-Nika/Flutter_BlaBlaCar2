import 'package:blabla/data/repository/location/location_repository.dart';
import 'package:blabla/data/repository/location/location_repository_mock.dart';
import 'package:blabla/data/repository/ride/ride_repository.dart';
import 'package:blabla/data/repository/ride/ride_repository_mock.dart';
import 'package:blabla/data/repository/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repository/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:blabla/ui/states/ride_pref_states.dart';
import 'package:provider/provider.dart';

List<InheritedProvider> get devProvider {
  final ridePreferenceRepository = RidePreferenceRepositoryMock();
  // inject repository
  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    Provider<RidePreferenceRepository>(
      create: (_) => RidePreferenceRepositoryMock(),
    ),
    ChangeNotifierProvider<RidePrefStates>(
      create: (_) =>
          RidePrefStates(ridePreferenceRepository: ridePreferenceRepository),
    ),
  ];
}

void main() {
  mainCommon(devProvider);
}
