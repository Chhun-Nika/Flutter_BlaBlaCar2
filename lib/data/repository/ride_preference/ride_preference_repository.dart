import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  Future<List<RidePreference>> getPrefHistory();
  Future<void> addRidePrefToHistory(RidePreference ridePref);
}
