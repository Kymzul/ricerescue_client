import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:vhack_client/controller/provider/crop/crop_provider.dart';
import 'package:vhack_client/controller/provider/field/type_field_provider.dart';
import 'package:vhack_client/presentation/screen/bridge_screen.dart';
import 'package:vhack_client/presentation/screen/util/welcome/welcome_screen.dart';
import 'package:vhack_client/shared/constant/custom_snackbar.dart';
import 'package:vhack_client/shared/theme/dark_theme.dart';
import 'package:vhack_client/shared/theme/light_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CropProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TypeFieldProvider(),
          )
        ],
        child: buildMaterialApp(),
      );

  MaterialApp buildMaterialApp() => MaterialApp(
      scaffoldMessengerKey: SnackBarUtil.messengerKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: WelcomeScreen());
}
