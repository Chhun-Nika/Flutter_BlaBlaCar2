import 'package:blabla/ui/states/ride_pref_states.dart';
import 'package:flutter/widgets.dart';

import '../../../../model/ride_pref/ride_pref.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePrefStates ridePrefStates;
  List<RidePreference> _history = [];

  HomeViewModel({required this.ridePrefStates}) {
    ridePrefStates.addListener(_onRidePrefStateChanged);
  }

  void _onRidePrefStateChanged() {
    notifyListeners();
  }

  void selectedPreference(RidePreference selectedPreference) async {
    await ridePrefStates.selectPreference(selectedPreference);
  }

  Future<void> loadRidePrefHistory() async {
    _history = await ridePrefStates.getRidePrefHistory();
  }

  RidePreference? get getSelectedPref => ridePrefStates.selectedPreference;

  List<RidePreference> get prefHistory => _history.reversed.toList();

  @override
  void dispose() {
    ridePrefStates.removeListener(_onRidePrefStateChanged);
    super.dispose();
  }
}
