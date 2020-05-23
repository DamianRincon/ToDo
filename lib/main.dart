import 'package:hive/hive.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:ToDo/src/model/task.dart';
import 'package:ToDo/src/model/trash.dart';
import 'package:ToDo/src/view/main_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ToDo/src/provider/app_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //statusBarIconBrightness: Brightness.light
  ));
  if(kIsWeb)
    Hive.init(dir.path);
  else
    await Hive.initFlutter(dir.path);

  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TrashAdapter());
  await Hive.openBox('app');
  await Hive.openBox('trash');
  await Hive.openBox('task');
  Box app = Hive.box('app');

  runApp(
    MultiProvider(  
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider(app)),
      ],
      child: MaterialApp(
        title: "ToDo List",
        debugShowCheckedModeBanner: true,
        theme: app.get('dark_mode', defaultValue: false) ? darkTheme : lightTheme,
        home: MainPage(),
      )
    )
  );
}