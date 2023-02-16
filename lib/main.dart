import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:yisunsin/const/add_license.dart';
import 'package:yisunsin/provider/animation_provider.dart';
import 'package:yisunsin/provider/app_info_provider.dart';
import 'package:yisunsin/view/home_view.dart';
import 'package:yisunsin/provider/coin_state_provider.dart';
import 'package:yisunsin/view/splash_screen.dart';

void main() {
  addLicenses();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoinStateProvider()),
        ChangeNotifierProvider(create: (_) => AppInfoProvider()),
        ChangeNotifierProvider(create: (_) => AnimationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: ((context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        }),
        home: Builder(builder: (newContext) {
          // Fullscreen display with status and navigation bars presentable
          // temporarly through a swipe gesture at the edges of the display.
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

          return FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Provider.of<AppInfoProvider>(context).saveVersion(
                    version: snapshot.data!.version,
                    buildNumber: snapshot.data!.buildNumber,
                  );
                  return const HomeView();
                } else {
                  return const SplashScreen();
                }
              });
        }),
      ),
    ),
  );
}
