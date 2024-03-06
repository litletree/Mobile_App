import 'package:flutter/foundation.dart';

class CounterState extends ChangeNotifier{
  int count = 0; // trạng thái của ứng dụng
  tang(){
    count++;
    notifyListeners();
  }
  giam(){
    count--;
    notifyListeners();
  }
}