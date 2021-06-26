import 'package:flutter/cupertino.dart';
import 'package:texster/utils/enums.dart';

class CurveModel extends ChangeNotifier {
  double valueOfA = 1.0001;
  double valueOfB = 0.0001;
  double valueOfC = 0.0001;
  double valueOfD = 0.0001;
  int selected = 0;

  Equations selectedEquation = Equations.linear;
  List<Equations> _equations = Equations.values;

  List _headerText = ['AX+BY+C=0', 'AX^2+BX+C=0', 'AX^3+BX^2+CX+D=0'];

  void changeA(double value) {
    valueOfA = value;
    notifyListeners();
  }

  void changeB(double value) {
    valueOfB = value;
    notifyListeners();
  }

  void changeC(double value) {
    valueOfC = value;
    notifyListeners();
  }

  void changeD(double value) {
    valueOfD = value;
    notifyListeners();
  }

  void dropDownChanged(int a) {
    selected = a;
    selectedEquation = _equations[selected];
    notifyListeners();
  }

  String get getHeaderText {
    return _headerText[selected];
  }
}
