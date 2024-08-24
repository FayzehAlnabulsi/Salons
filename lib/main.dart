import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'BackEnd/provider_class.dart';
import 'Screans/Account/Introduction.dart';
import 'Screans/Account/logIn.dart';
import 'Widget/AppColor.dart';
import 'Widget/AppSize.dart';
import 'Widget/AppText.dart';

void main() {
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
                  debugShowCheckedModeBanner: false,
                  // localizationsDelegates: const [
                  //   GlobalMaterialLocalizations.delegate,
                  //   GlobalWidgetsLocalizations.delegate,
                  //   GlobalCupertinoLocalizations.delegate,
                  // ],
                  // supportedLocales: const [
                  //   Locale('en', ''),
                  //   Locale('ar', ''), // arabic, no country code
                  // ],
                  // initialRoute: Login.route,
                  // routes: <String, WidgetBuilder>{
                  //   Login.route: (_) => Login(),
                  // },
                  home: const IntroductionScreen(),
                  title: 'لوحة التحكم',
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
                          indent: 5.spMin),
                      drawerTheme: DrawerThemeData(
                          surfaceTintColor: AppColor.white,
                          backgroundColor: AppColor.white)),
                  builder: (context, widget) {
                    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaler: const TextScaler.linear(1.0)),
                        child: const SizedBox(),
                      );
                    };
                    return Directionality(
                        textDirection: TextDirection.rtl, child: widget!);
                  },
                )));
  }
}
