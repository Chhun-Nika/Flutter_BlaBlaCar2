import 'package:blabla/data/repository/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePrefStates extends ChangeNotifier {
  final RidePreferenceRepository ridePreferenceRepository;
  RidePreference? _selectedPreference;

  RidePrefStates({required this.ridePreferenceRepository});

  Future<List<RidePreference>> getRidePrefHistory() async {
    return await ridePreferenceRepository.getPrefHistory();
  }

  Future<void> selectPreference(RidePreference preference) async {
    if (preference != _selectedPreference) {
      // Set the selected preference
      _selectedPreference = preference;

      // Push to history
      await ridePreferenceRepository.addRidePrefToHistory(preference);
      notifyListeners();
    }
  }

  RidePreference? get selectedPreference => _selectedPreference;
}
