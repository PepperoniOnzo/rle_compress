import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rle_compress/data/colors.dart';
import 'package:rle_compress/screens/home_page.dart';
import 'package:rle_compress/view/view_rle.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ViewRLE()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: ColorsData.backgroundPrimary,
          fontFamily: 'Montserrat'),
      home: const HomePage(),
    );
  }
}
