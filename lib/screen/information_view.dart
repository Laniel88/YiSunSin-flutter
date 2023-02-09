import 'package:flutter/material.dart';
import 'package:yisunsin/const/colors.dart';
import 'package:yisunsin/components/os_dependent.dart';
import 'package:yisunsin/provider/coin_state_provider.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
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
                const _Content(),
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
              "INFO",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: "LineSeed",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(
          width: iconSize + 10,
        )
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "이순신 술 게임",
            style: TextStyle(
              color: Color.fromARGB(255, 48, 48, 48),
              fontSize: 33,
              fontFamily: "LineSeed",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 13),
          const Text(
            "해당 룰은 동전 2개를 기준으로 하며, "
            "\n확률 조정 기능이 추가되면서 의미가 없어진 동전 1개 기능은 제외되었습니다.",
            style: TextStyle(
              color: Color.fromARGB(255, 91, 91, 91),
              fontSize: 13,
              fontFamily: "LineSeed",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "1. 대형 컵 하나를 두고 각자의 턴에 잔에 술을 따른다.\n    (원하는 만큼, 또는 1잔)"
            "\n\n"
            "2. 동전 두개를 던져 결과에 따라 다음 행동을 취한다.",
            style: TextStyle(
              color: Color.fromARGB(255, 45, 45, 45),
              fontSize: 14.5,
              fontFamily: "LineSeed",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(getImagePath(CoinState.front), width: 45),
              Image.asset(getImagePath(CoinState.front), width: 45),
              const Text(
                ": 잔에 있는 모든 술을 맛있게 먹는다",
                style: TextStyle(
                  color: Color.fromARGB(255, 45, 45, 45),
                  fontSize: 13,
                  fontFamily: "LineSeed",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(getImagePath(CoinState.front), width: 45),
              Image.asset(getImagePath(CoinState.back), width: 45),
              const Text(
                ": 잔을 그대로 왼쪽(정방향) 사람에게 전달",
                style: TextStyle(
                  color: Color.fromARGB(255, 45, 45, 45),
                  fontSize: 13,
                  fontFamily: "LineSeed",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(getImagePath(CoinState.back), width: 45),
              Image.asset(getImagePath(CoinState.back), width: 45),
              const Text(
                ": 잔을 그대로 오른쪽(역방향) 사람에게 전달",
                style: TextStyle(
                  color: Color.fromARGB(255, 45, 45, 45),
                  fontSize: 13,
                  fontFamily: "LineSeed",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "3. 1,2의 과정을 계속 반복한다.",
            style: TextStyle(
              color: Color.fromARGB(255, 45, 45, 45),
              fontSize: 14.5,
              fontFamily: "LineSeed",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "확률 조정이 필요할 경우 설정에서 확률을 수정할 수 있습니다."
            "\n위의 3가지 경우에 대해 수치를 조정할 수 있으며, 이 수치값으로 확률이 계산됩니다."
            "\n기본 수치는 [1 | 2 | 1] (25%, 50%, 25%) 입니다.",
            style: TextStyle(
              color: Color.fromARGB(255, 91, 91, 91),
              fontSize: 13,
              fontFamily: "LineSeed",
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
