// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:math';

import 'package:flutter/material.dart';

class CoinStateProvider extends ChangeNotifier {
  bool _isFlipping = false;
  bool get isFlipping => _isFlipping;

  CoinState _firstCoinState = CoinState.front;
  CoinState _secondCoinState = CoinState.back;
  CoinState get firstCoinState => _firstCoinState;
  CoinState get secondCoinState => _secondCoinState;

  CoinState _firstCoinTarget = CoinState.front;
  CoinState _secondCoinTarget = CoinState.back;

  int _powerFF = 1;
  int _powerFB = 2;
  int _powerBB = 1;
  int get powerFF => _powerFF;
  int get powerFB => _powerFB;
  int get powerBB => _powerBB;

  setFlipState(bool state) {
    _isFlipping = state;
    notifyListeners();
  }

  setFirstCoinState(CoinState state) {
    _firstCoinState = state;
  }

  setSecondCoinState(CoinState state) {
    _secondCoinState = state;
  }

  setPowerFF(int ff) {
    _powerFF = ff;
    notifyListeners();
  }

  setPowerFB(int fb) {
    _powerFB = fb;
    notifyListeners();
  }

  setPowerBB(int bb) {
    _powerBB = bb;
    notifyListeners();
  }

  flipCoin() {
    int rand = Random().nextInt(_powerFF + _powerFB + _powerBB);
    if (rand < _powerFF) {
      _firstCoinTarget = CoinState.front;
      _secondCoinTarget = CoinState.front;
    } else if (_powerFF <= rand && rand < _powerFF + _powerFB / 2) {
      _firstCoinTarget = CoinState.back;
      _secondCoinTarget = CoinState.front;
    } else if (_powerFF + _powerFB / 2 <= rand && rand < _powerFF + _powerFB) {
      _firstCoinTarget = CoinState.front;
      _secondCoinTarget = CoinState.back;
    } else {
      _firstCoinTarget = CoinState.back;
      _secondCoinTarget = CoinState.back;
    }
  }

  updateState() {
    _firstCoinState = _firstCoinTarget;
    _secondCoinState = _secondCoinTarget;
  }

  String getFirstCoinAnimationPath() {
    String basePath = "assets/coin/";
    if (_firstCoinState == CoinState.front)
      basePath += "F";
    else
      basePath += "B";

    if (_firstCoinTarget == CoinState.front)
      basePath += "F";
    else
      basePath += "B";

    return basePath;
  }

  String getSecondCoinAnimationPath() {
    String basePath = "assets/coin/";
    if (_secondCoinState == CoinState.front)
      basePath += "F";
    else
      basePath += "B";

    if (_secondCoinTarget == CoinState.front)
      basePath += "F";
    else
      basePath += "B";

    return basePath;
  }
}

String getImagePath(CoinState state) {
  if (state == CoinState.front)
    return "assets/coin/front.png";
  else
    return "assets/coin/back.png";
}

enum CoinState {
  front,
  back,
}
