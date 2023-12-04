import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_app_flutter_project/base/base_page.dart';
import 'package:tasks_app_flutter_project/base/common_const.dart';
import 'package:tasks_app_flutter_project/base/hive_use_case.dart';
import 'package:tasks_app_flutter_project/home_view_model.dart';

void main() async {
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
        child: MyApp(),
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(context.locale.toString());
    print('home'.tr());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('home'.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomePage extends StatelessWidget with BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(homeViewModelProvider).pageState;
        return initBody(
          pageState: pageState,
          normalBody: _buildNormalBodyWidget(context, ref),
        );
      },
    );
  }

  Widget _buildNormalBodyWidget(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _buildListWidget(context, ref),
        InkWell(
          child: Row(
            children: [
              Text('123'),
              Icon(Icons.check),
            ],
          ),
          onFocusChange: (value) {
            print(value);
          },
          onTapDown: (details) {
            print('down');
          },
          onTapUp: (details) {
            print('up');
          },
        ),
      ],
    );
  }

  Widget _buildListWidget(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          ref.read(homeViewModelProvider.notifier).readRecordList();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.fadeTitle,
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                ],
                background: Image.asset(
                  'assets/image/background_image.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              leading: const Icon(Icons.note),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // ref
                            //     .read(homeViewModelProvider.notifier)
                            //     .addRecord();
                            // showModalBottomSheet(
                            //   context: context,
                            //   isScrollControlled: true,
                            //   builder: (context) => const AddRecordPage(),
                            // );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child:
                                    Icon(Icons.mode_edit_outlined, size: 14.0),
                              ),
                              Text(LocaleString.addRecord),
                            ],
                          ),
                        ),
                      )
                    ]),
                    const Text('日付'),
                    Column(
                      children: ref
                          .read(homeViewModelProvider.notifier)
                          .readRecordList()
                          .map(
                            (e) => HomeItemWidget(
                                content:
                                    e.amountOfNumber + e.category + e.note),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}

class HomeItemWidget extends StatelessWidget {
  final String content;
  const HomeItemWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.ac_unit),
                Text(content),
                const Text('\$2.0'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
