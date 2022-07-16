import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class CounterProvider extends ChangeNotifier {
  var _counter = 80;
  double _nou_am = 16;
  double _nou_ac = 16;
  double _cp_am = 16;
  double _cp_ac = 120;
  double _ap_am = 12.8;
  double _ap_ac = 96;
  double _wu_am = 240;
  double _cc_am = 32;
  double _cc_ac = 48;
  double _pt_am = 10;
  double _pt_ac = 10;
  double _cs_am = 1000;
  double _cs_ac = 1000;
  double _oc_am = 1.28;
  double _oc_ac = 9.6;
  double _c_saving = 16;
  double _ao_saing = 8.32;
  double _t_saving = 24.32;
  String _message = '';
  bool _is_error = false;

  int get getCounter => _counter;
  double get getNouAm => _nou_am;
  double get getNouAc => _nou_ac;
  double get getCpAm => _cp_am;
  double get getCpAc => _cp_ac;
  double get getApAm => _ap_am;
  double get getApAc => _ap_ac;
  double get getWuAm => _wu_am;
  double get getCcAm => _cc_am;
  double get getCcAc => _cc_ac;
  double get getPtAm => _pt_am;
  double get getPtAc => _pt_ac;
  double get getCsAm => _cs_am;
  double get getCsAc => _cs_ac;
  double get getOcAm => _oc_am;
  double get getOcAc => _oc_ac;
  double get getCSrving => _c_saving;
  double get getAOseving => _ao_saing;
  double get getTServing => _t_saving;
  String get getMessage => _message;
  bool get getIsError => _is_error;

  void increaseCounter() {
    if (_counter == 500) {
      _counter = _counter;
      _message = "The heigher limit is 500";
      _is_error = true;
    } else {
      _counter = _counter + 5;
      _is_error = false;
    }
  }

  void count() {
    Future.delayed(Duration(seconds: 10), () {
      _is_error = false;
    });
  }

  void decreaseCounter() {
    if (_counter == 5) {
      _counter = _counter;
      _message = "The lower limit is 5";
      _is_error = true;
    } else {
      _counter = _counter - 5;
      _is_error = false;
    }
  }

  void setunits() {
    _nou_am = _counter / 5;
    _nou_ac = _nou_am;
    _cp_am = _counter * 0.2;
    _cp_ac = 5 * 1.5 * _nou_ac;
    _ap_am = _cp_am * 0.8;
    _ap_ac = _cp_ac * 0.8;
    _wu_am = _counter * 3;
    _cc_am = 2 * _nou_am;
    _cc_ac = 3 * _nou_ac;
    _oc_am = _cs_am * _pt_am * _ap_am / 100000;
    _oc_ac = _cs_ac * _pt_ac * _ap_ac / 100000;
    _c_saving = _cc_ac - _cc_am;
    _ao_saing = _oc_ac - _oc_am;
    _t_saving = _c_saving + _ao_saing;

    Logger().i(_t_saving);
    notifyListeners();
  }
}
