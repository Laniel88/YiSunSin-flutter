import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yisunsin/const/colors.dart';
import 'package:yisunsin/provider/coin_state_provider.dart';

class FlipButton extends StatelessWidget {
  final void Function() onPressed;
  const FlipButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!Provider.of<CoinStateProvider>(context).isFlipping) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              side: const BorderSide(width: 2, color: Colors.black),
              foregroundColor: BUTTON_COLOR,
              backgroundColor: BUTTON_COLOR,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(vertical: 10)),
          child: Image.asset(
            "assets/img/coin.png",
            height: 30,
          ),
        ),
      );
    } else {
      return const SizedBox(height: 40);
    }
  }
}
