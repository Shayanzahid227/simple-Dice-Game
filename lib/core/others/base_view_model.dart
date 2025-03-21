import 'package:dice_game/core/enums/view_state_model.dart';
import 'package:flutter/foundation.dart';

///
/// [BaseViewModel] is the base class with all
/// state related logic.
///
/// [BaseViewModel] class will be extended by all viewModels.
///
/// [setState] will be used to update the state of the screen
///
class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
