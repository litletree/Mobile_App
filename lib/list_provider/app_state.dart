import 'package:flutter/foundation.dart';
import 'dart:core';

class AppState extends ChangeNotifier{
  List<String> _dssp = [
    "Táo", "Lê", "Chuối", "Xoài", "Đu đủ", "ổi", "Mít", "Đào", "Cam", "Mận",
  "Chanh", "Sầu Riêng", "Dừa", "Bưởi"
  ];

  List<int> _gioHang = [];
  List<String> get dssp => _dssp;
  List<int> get gioHang => _gioHang;
  int get slMH_GioHang => _gioHang.length;

  void them(int index){
    if(mhCoTrongGioHang(index) == false){
      _gioHang.add(index);
      notifyListeners();
    }
  }

  bool mhCoTrongGioHang(int index){
    for(int i in _gioHang)
      if(i == index) return true;
    return false;
  }
  void xoaMH_trong_GH(int index){
    _gioHang.removeAt(index);
    notifyListeners();
  }
}