import 'package:blabla/data/repository/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final List<RidePreference> _preferenceHistory = [];

  @override
  Future<List<RidePreference>> getPrefHistory() async {
    return _preferenceHistory;
  }
  
  @override
  Future<void> addRidePrefToHistory(RidePreference ridePref) async {
    _preferenceHistory.add(ridePref);
  }

  
}
