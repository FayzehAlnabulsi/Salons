import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'BackEnd/provider_class.dart';
import 'Screans/Account/Introduction.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                  locale: const Locale('en', ''),
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: const IntroductionScreen(),
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
