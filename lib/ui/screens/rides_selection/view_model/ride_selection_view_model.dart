import 'package:blabla/data/repository/ride/ride_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_pref_states.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride/ride.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePrefStates ridePrefStates;
  final RideRepository rideRepository;
  List<Ride> _allRides = [];

  RideSelectionViewModel({
    required this.ridePrefStates,
    required this.rideRepository,
  }) {
    ridePrefStates.addListener(_onRidePrefStateChanged);
    _init();
  }

  void _onRidePrefStateChanged() {
    notifyListeners();
  }

  void _init() async {
    _allRides = await rideRepository.getAllRides();
    notifyListeners();
  }

  RidePreference? get getSelectedRidePref => ridePrefStates.selectedPreference;

  List<Ride> getMatchingRides(RidePreference preference) {
    return _allRides
        .where(
          (ride) =>
              ride.departureLocation == preference.departure &&
              ride.arrivalLocation == preference.arrival &&
              ride.availableSeats >= preference.requestedSeats,
        )
        .toList();
  }

  void selectedPreference(RidePreference selectedPreference) async {
    await ridePrefStates.selectPreference(selectedPreference);
  }

  @override
  void dispose() {
    ridePrefStates.removeListener(_onRidePrefStateChanged);
    super.dispose();
  }
}
