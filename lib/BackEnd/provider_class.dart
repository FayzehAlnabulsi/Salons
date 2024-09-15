import 'package:flutter/cupertino.dart';

class ProviderClass extends ChangeNotifier {
  Locale locale = const Locale('en', '');

  setLocale(BuildContext context, Locale newLocale) {
    locale = newLocale;
  }
}
