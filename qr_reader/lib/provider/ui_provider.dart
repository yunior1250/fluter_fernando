

import 'package:flutter/material.dart';

class UiPRovider extends ChangeNotifier {

  int _selectedMenuOpt = 0 ;

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    this._selectedMenuOpt=i;
    notifyListeners();

  }
}
