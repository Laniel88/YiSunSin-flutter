import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:provider/provider.dart';
import 'package:yisunsin/provider/coin_state_provider.dart';

class Coins extends StatelessWidget {
  const Coins({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height < 980
        ? MediaQuery.of(context).size.height / 4 + 15
        : 260;
    List<bool> animationFinished = [false, false];

    if (Provider.of<CoinStateProvider>(context).isFlipping == true) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size,
            child: ImageSequenceAnimator(
              Provider.of<CoinStateProvider>(context)
                  .getFirstCoinAnimationPath(),
              "",
              1,
              1,
              "png",
              169,
              isLooping: false,
              fps: 27 + Random().nextInt(10).toDouble(),
              onFinishPlaying: (_) {
                animationFinished[0] = true;
                if (animationFinished[1] == true) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Provider.of<CoinStateProvider>(context, listen: false)
                        .setFlipState(false);
                  });
                }
              },
            ),
          ),
          SizedBox(
            height: size,
            child: ImageSequenceAnimator(
              Provider.of<CoinStateProvider>(context)
                  .getSecondCoinAnimationPath(),
              "",
              1,
              1,
              "png",
              169,
              isLooping: false,
              fps: 27.5 + Random().nextInt(10).toDouble(),
              onFinishPlaying: (_) {
                animationFinished[1] = true;
                if (animationFinished[0] == true) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Provider.of<CoinStateProvider>(context, listen: false)
                        .setFlipState(false);
                  });
                }
              },
            ),
          ),
        ],
      );
    } else {
      Provider.of<CoinStateProvider>(context).updateState();
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size,
            child: Image.asset(getImagePath(
              Provider.of<CoinStateProvider>(context).firstCoinState,
            )),
          ),
          SizedBox(
            height: size,
            child: Image.asset(getImagePath(
              Provider.of<CoinStateProvider>(context).secondCoinState,
            )),
          ),
        ],
      );
    }
  }
}
