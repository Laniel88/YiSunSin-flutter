/* 
Only the existence of animation is handled in <CoinStateProvider>,
and all other settings such as animation types are managed in this class.
*/
import 'package:flutter/material.dart';

class AnimationProvider extends ChangeNotifier {
  AnimationType _animationType = AnimationType.none;
  AnimationType get animationType => _animationType;

  setAnimationType(AnimationType type) {
    _animationType = type;
    notifyListeners();
  }

  setAnimationTypeWithIndex(int index) {
    _animationType = animationIndex[index] ?? AnimationType.none;
    notifyListeners();
  }

  int getIndexByAnimationType() {
    return animationIndex.keys
        .firstWhere((element) => animationIndex[element] == _animationType);
  }
}

enum AnimationType {
  none,
  floatingSoju,
  floatingSojuGlass,
}

Map<int, AnimationType> animationIndex = {
  0: AnimationType.none,
  1: AnimationType.floatingSoju,
  2: AnimationType.floatingSojuGlass,
};
