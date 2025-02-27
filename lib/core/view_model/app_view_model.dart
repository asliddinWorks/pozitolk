
import 'package:flutter/cupertino.dart';
import '../data/data_source/local/app_local_data.dart';

class AppViewModel extends ChangeNotifier {

  // This variable holds the current number of columns in the grid.
  // It defaults to 2, meaning the grid will initially display 2 columns.
  int axisCount = 2;

  /// This method toggles the number of columns in the gridbetween 1 and 2.
  /// It then saves the updated value to local storage using [AppLocalData].
  /// Finally, it notifies listeners to rebuild the UI with the new grid configuration.
  Future<void> saveGridAxisCount() async {
    axisCount = axisCount == 1 ? 2 : 1;
    await AppLocalData.saveGridAxisCount(axisCount);
    notifyListeners();
  }

  /// This method retrieves the saved grid axis count from local storage.
  /// It updates the [axisCount] variable with the retrieved value.
  /// Finally, it notifies listeners to rebuild the UI with the retrieved grid configuration.
  Future<void> getGridAxisCount() async {
    axisCount = await AppLocalData.getGridAxisCount();
    notifyListeners();
  }
}