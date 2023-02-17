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

  bool _animation = false;
  bool get animation => _animation;

  int _powerFF = 1;
  int _powerFB = 2;
  int _powerBB = 1;
  int get powerFF => _powerFF;
  int get powerFB => _powerFB;
  int get powerBB => _powerBB;

  checkAnimation() {
    if (_firstCoinState == CoinState.front &&
        _secondCoinState == CoinState.front)
      _animation = true;
    else
      _animation = false;
  }

  quitAnimation() {
    _animation = false;
  }

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
    _powerFF = nonZero(ff, _powerFB, _powerBB) ? ff : 1;
    notifyListeners();
  }

  setPowerFB(int fb) {
    _powerFB = nonZero(_powerFF, fb, _powerBB) ? fb : 1;
    notifyListeners();
  }

  setPowerBB(int bb) {
    _powerBB = nonZero(_powerFF, _powerFB, bb) ? bb : 1;
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

  bool nonZero(int a, int b, int c) {
    if (a == 0 && b == 0 && c == 0) return false;
    return true;
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
