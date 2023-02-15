import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    bool isFlipping =
        Provider.of<CoinStateProvider>(context, listen: true).isFlipping;

    if (isFlipping) {
      return AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
                image: Image.asset("assets/img/soju.png"),
                spawnMaxRadius: 50,
                spawnMinRadius: 10,
                maxOpacity: 0.8,
                minOpacity: 0.4,
                particleCount: 15,
                opacityChangeRate: 0.4),
          ),
          vsync: this,
          child: widget.child);
    } else {
      return widget.child;
    }
  }
}
