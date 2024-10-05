import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'BackEnd/provider_class.dart';
import 'Screans/Account/Introduction.dart';
import 'Screans/Home/main_screan.dart';
import 'Widget/AppColor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAJRmpxtxGjuu3R5ArINGpzxs0v4bwrA7M",
      appId: "1:811991417170:android:80e3b5818864465ea33a8b",
      messagingSenderId: "811991417170",
      projectId: "salons-8fdb4",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  static Locale? getLocale(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    return state?.getLocale();
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  getLocale() {
    return _locale;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProviderClass(),
          )
        ],
        child: ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, __) => MaterialApp(
                  locale: _locale,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const MainScreen(),
                  theme: ThemeData(
                      scaffoldBackgroundColor: AppColor.backGroundColor,
                      useMaterial3: true,
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      cardTheme: CardTheme(
                          surfaceTintColor: Colors.white,
                          color: AppColor.white),
                      dividerColor: AppColor.grey.withOpacity(0.2),
                      dividerTheme: DividerThemeData(
                          thickness: 0.5.spMin,
                          endIndent: 5.spMin,
                          indent: 5.spMin)),
                )));
  }
}
