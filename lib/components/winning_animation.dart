import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yisunsin/provider/animation_provider.dart';
import 'package:yisunsin/provider/coin_state_provider.dart';

class WinningAnimation extends StatefulWidget {
  final Widget child;
  const WinningAnimation({
    required this.child,
    super.key,
  });

  @override
  State<WinningAnimation> createState() => _WinningAnimationState();
}

class _WinningAnimationState extends State<WinningAnimation>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    bool isAnimationState = Provider.of<CoinStateProvider>(context).animation;
    AnimationType animationType =
        Provider.of<AnimationProvider>(context).animationType;

    if (!isAnimationState || animationType == AnimationType.none) {
      return widget.child;
    }

    if (animationType == AnimationType.floatingSoju) {
      return AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
                image: Image.asset("assets/img/soju_bottle.png"),
                spawnMaxRadius: 50,
                spawnMinRadius: 20,
                maxOpacity: 0.7,
                minOpacity: 0.4,
                particleCount: 10,
                opacityChangeRate: 0.4),
          ),
          vsync: this,
          child: widget.child);
    } else if (animationType == AnimationType.floatingSojuGlass) {
      return AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
                image: Image.asset("assets/img/soju_glass.png"),
                spawnMaxRadius: 20,
                spawnMinRadius: 10,
                maxOpacity: 0.7,
                minOpacity: 0.4,
                particleCount: 10,
                opacityChangeRate: 0.4),
          ),
          vsync: this,
          child: widget.child);
    }

    return widget.child;
  }
}
