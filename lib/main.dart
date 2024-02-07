import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_app_flutter_project/base/hive_use_case.dart';
import 'package:tasks_app_flutter_project/home/home_page.dart';
import 'package:test_02_package/test_02_package.dart';
import 'package:test_02_package/test_02_package_method_channel.dart';

void main() async {
  final p = Test02Package();
  p.getPlatformVersion();

  MethodChannelTest02Package();

  WidgetsFlutterBinding().ensureVisualUpdate();
  await EasyLocalization.ensureInitialized();
  await HiveUseCase().init();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('zh'),
          Locale('ja'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
