import 'package:ToDo/src/pages/home/home_page.dart';
import 'package:ToDo/src/pages/onboarding/onboarding_page.dart';
import 'package:ToDo/src/provider/theme_data.dart';
import 'package:hive/hive.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ToDo/src/util/sys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ToDo/src/provider/theme_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  if(Sys.isWeb)
    Hive.init(dir.path);
  else
    await Hive.initFlutter(dir.path);

  await Hive.openBox('settings');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  
  var settings = Hive.box('settings');
  print(settings.get('dark_mode'));

  runApp(
    Provider(
      create: (_) => ThemeProvider(),
      child: MaterialApp(
        title: "ToDo List App",
        debugShowCheckedModeBanner: true,
        locale: Locale(settings.get('locale', defaultValue: Sys.locale)),
        theme: settings.get('dark_mode', defaultValue: false) ? darkTheme : lightTheme,
        home: settings.get('home', defaultValue: true) ? HomePage() : OnboardingPage(),
      )
    )
  );

}