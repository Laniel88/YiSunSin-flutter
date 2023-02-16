import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:yisunsin/const/colors.dart';
import 'package:yisunsin/components/os_dependent.dart';
import 'package:yisunsin/provider/animation_provider.dart';
import 'package:yisunsin/provider/app_info_provider.dart';
import 'package:yisunsin/provider/coin_state_provider.dart';

class SettingsVeiw extends StatelessWidget {
  const SettingsVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    String version = Provider.of<AppInfoProvider>(context).version;
    String buildNumber = Provider.of<AppInfoProvider>(context).buildNumber;

    final sizeWeight = MediaQuery.of(context).size.width / 400;

    return Scaffold(
        backgroundColor: BACKGROUND_COLOR2,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TopSpacing(),
                _Header(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 20),
                _Sliders(sizeWeight: sizeWeight),
                const SizedBox(height: 50),
                _AnimationSelector(sizeWeight: sizeWeight),
                const SizedBox(height: 30),
                _License(
                  sizeWeight: sizeWeight,
                  version: version,
                  buildNumber: buildNumber,
                ),
                const SizedBox(height: 30),
                _AppVersion(
                  sizeWeight: sizeWeight,
                  version: version,
                  buildNumber: buildNumber,
                )
              ],
            ),
          ),
        ));
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;
  const _Header({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          padding: const EdgeInsets.all(8.0),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
            size: iconSize,
          ),
          splashRadius: 0.5,
        ),
        const Expanded(
          child: Center(
            child: Text(
              "SETTINGS",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontFamily: "LineSeed",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(
          width: iconSize + 15,
        )
      ],
    );
  }
}

class _Sliders extends StatelessWidget {
  final double sizeWeight;
  const _Sliders({
    required this.sizeWeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int ff = Provider.of<CoinStateProvider>(context).powerFF;
    int fb = Provider.of<CoinStateProvider>(context).powerFB;
    int bb = Provider.of<CoinStateProvider>(context).powerBB;

    return SliderTheme(
      data: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorColor: Colors.black,
        valueIndicatorTextStyle: TextStyle(fontFamily: "LineSeed"),
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "확률 수정",
              style: TextStyle(
                color: Color.fromARGB(255, 69, 69, 69),
                fontSize: 20,
                fontFamily: "LineSeed",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Image.asset(getImagePath(CoinState.front),
                  width: 50 * sizeWeight),
              Image.asset(getImagePath(CoinState.front),
                  width: 50 * sizeWeight),
              Expanded(
                child: Slider(
                  value: ff.toDouble(),
                  min: 0,
                  max: 6,
                  label: ff.toString(),
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  onChanged: (value) {
                    Provider.of<CoinStateProvider>(context, listen: false)
                        .setPowerFF(value.round());
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Image.asset(getImagePath(CoinState.front),
                  width: 50 * sizeWeight),
              Image.asset(getImagePath(CoinState.back), width: 50 * sizeWeight),
              Expanded(
                child: Slider(
                  value: fb.toDouble(),
                  min: 0,
                  max: 6,
                  label: fb.toString(),
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  onChanged: (value) {
                    Provider.of<CoinStateProvider>(context, listen: false)
                        .setPowerFB(value.round());
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Image.asset(getImagePath(CoinState.back), width: 50 * sizeWeight),
              Image.asset(getImagePath(CoinState.back), width: 50 * sizeWeight),
              Expanded(
                child: Slider(
                  value: bb.toDouble(),
                  min: 0,
                  max: 6,
                  label: bb.toString(),
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  onChanged: (value) {
                    Provider.of<CoinStateProvider>(context, listen: false)
                        .setPowerBB(value.round());
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "현재 확률 : [ ${100 * ff ~/ (ff + fb + bb)}% | ${100 * fb ~/ (ff + fb + bb)}% | ${100 * bb ~/ (ff + fb + bb)}% ]",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 13 * sizeWeight,
                fontFamily: "LineSeed",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimationSelector extends StatelessWidget {
  final double sizeWeight;
  const _AnimationSelector({
    required this.sizeWeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            "당첨 애니메이션 선택",
            style: TextStyle(
              color: Color.fromARGB(255, 69, 69, 69),
              fontSize: 20,
              fontFamily: "LineSeed",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CupertinoTheme(
            data: const CupertinoThemeData(brightness: Brightness.light),
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                  initialItem: Provider.of<AnimationProvider>(context)
                      .getIndexByAnimationType()),
              squeeze: 1.7,
              itemExtent: 45,
              looping: false,
              onSelectedItemChanged: (int value) {
                Provider.of<AnimationProvider>(context, listen: false)
                    .setAnimationTypeWithIndex(value);
              },
              children: [
                Center(child: Text("애니메이션 비활성화", style: pickerTextStyle())),
                Center(child: Text("날아라 소주병", style: pickerTextStyle())),
                Center(child: Text("날아라 소주잔", style: pickerTextStyle())),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "애니메이션은 계속해서 추가될 예정입니다",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 112, 112, 112),
              fontSize: 13,
              fontFamily: "LineSeed",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  TextStyle pickerTextStyle() => const TextStyle(fontSize: 20);
}

class _License extends StatelessWidget {
  final double sizeWeight;
  final String version;
  final String buildNumber;
  const _License({
    required this.sizeWeight,
    required this.version,
    required this.buildNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            "라이선스 (LICENSE)",
            style: TextStyle(
              color: Color.fromARGB(255, 69, 69, 69),
              fontSize: 20,
              fontFamily: "LineSeed",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: BACKGROUND_COLOR2,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: _license("ver $version +$buildNumber"),
                    type: PageTransitionType.fade,
                    curve: Curves.bounceInOut,
                  ),
                );
              },
              child: const Text(
                "라이선스 페이지로 이동",
                style: TextStyle(
                  color: Color.fromARGB(255, 112, 112, 112),
                  fontSize: 15,
                  fontFamily: "LineSeed",
                  fontWeight: FontWeight.w400,
                ),
              )),
        ),
      ],
    );
  }
}

Widget _license(String data) {
  return Theme(
    data: ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 172, 170, 170),
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: "LineSeed",
            fontSize: 20,
          )),
      cardColor: BACKGROUND_COLOR,
    ),
    child: LicensePage(applicationVersion: data),
  );
}

class _AppVersion extends StatelessWidget {
  final double sizeWeight;
  final String version;
  final String buildNumber;
  const _AppVersion({
    required this.sizeWeight,
    required this.version,
    required this.buildNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            "앱 버전",
            style: TextStyle(
              color: Color.fromARGB(255, 69, 69, 69),
              fontSize: 20,
              fontFamily: "LineSeed",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              "ver $version+$buildNumber",
              style: const TextStyle(
                color: Color.fromARGB(255, 112, 112, 112),
                fontSize: 15,
                fontFamily: "LineSeed",
                fontWeight: FontWeight.w400,
              ),
            )),
      ],
    );
  }
}
