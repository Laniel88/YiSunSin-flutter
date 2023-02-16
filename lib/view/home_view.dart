import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:yisunsin/components/coins.dart';
import 'package:yisunsin/components/flip_button.dart';
import 'package:yisunsin/components/winning_animation.dart';
import 'package:yisunsin/const/colors.dart';
import 'package:yisunsin/components/os_dependent.dart';
import 'package:yisunsin/view/information_view.dart';
import 'package:yisunsin/view/settings_view.dart';
import 'package:yisunsin/provider/coin_state_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: WinningAnimation(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TopSpacing(),
              _Header(
                onPressedInformtaion: onPressedInformtaion,
                onPressedSettings: onPressedSettings,
              ),
              const Spacer(flex: 3),
              const Coins(),
              const Spacer(flex: 1),
              FlipButton(onPressed: onPressedFlipButton),
              const Spacer(flex: 9),
            ],
          ),
        ),
      ),
    );
  }

  onPressedInformtaion() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: const InformationView(),
      ),
    );
  }

  onPressedSettings() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: const SettingsVeiw(),
      ),
    );
  }

  onPressedFlipButton() {
    Provider.of<CoinStateProvider>(context, listen: false).flipCoin();
    Provider.of<CoinStateProvider>(context, listen: false).quitAnimation();
    Provider.of<CoinStateProvider>(context, listen: false).setFlipState(true);
  }
}

class _Header extends StatelessWidget {
  final void Function() onPressedSettings;
  final void Function() onPressedInformtaion;
  final double size = 36;

  const _Header({
    required this.onPressedSettings,
    required this.onPressedInformtaion,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isActivated = !Provider.of<CoinStateProvider>(context).isFlipping;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 13),
      child: isActivated
          ? Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: onPressedInformtaion,
                  child: Image.asset(
                    "assets/img/information.png",
                    height: size,
                  ),
                ),
                const SizedBox(width: 17),
                GestureDetector(
                  onTap: onPressedSettings,
                  child: Image.asset(
                    "assets/img/settings.png",
                    height: size,
                  ),
                )
              ],
            )
          : SizedBox(height: size),
    );
  }
}
