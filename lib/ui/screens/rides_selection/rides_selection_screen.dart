import 'package:blabla/data/repository/ride/ride_repository.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_selection_content.dart';
import 'package:blabla/ui/states/ride_pref_states.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RideSelectionViewModel(
        ridePrefStates: context.read<RidePrefStates>(),
        rideRepository: context.read<RideRepository>(),
      ),
      child: Consumer<RideSelectionViewModel>(
        builder: (context, vm, child) {
          return RideSelectionContent(vm: vm,);
        },
      ),
    );
  }
}
