import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warteg/page/CreateMenuPage.dart';
import 'package:warteg/page/DashBoard.dart';
import 'package:warteg/page/detail/DetailMenu.dart';
import 'package:warteg/page/detail/DetailPengguna.dart';
import 'package:warteg/page/ListMenuPage.dart';
import 'package:warteg/page/ListPenggunaPage.dart';
import 'package:warteg/service/api/ApiMenu.dart';
import 'package:warteg/service/api/ApiPengguna.dart';
import 'package:warteg/service/model/GetMenuResponse.dart';
import 'package:warteg/service/model/GetPenggunaResponse.dart';
import 'package:warteg/service/provider/GetMenuProvider.dart';
import 'package:warteg/service/provider/GetPenggunaProvider.dart';
import 'package:warteg/service/provider/PostMenuProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetMenuProvider(api: ApiMenu()),
        ),
        ChangeNotifierProvider(
          create: (_) => Postmenuprovider(api: ApiMenu()),
        ),
        ChangeNotifierProvider(
            create: (_) => GetPenggunaProvider(api: ApiPengguna()))
      ],
      child: MaterialApp(
        title: 'Warteg App', // Optional: Set a title for your app
        theme: ThemeData(
          primarySwatch: Colors.blue, // Optional: Set a theme color
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const DashBoard(),
          '/listMenu': (context) => const ListMenuPage(),
          '/createMenu': (context) => const CreateMenuPage(),
          '/listPengguna': (context) => const ListPenggunaPage(),
          '/detailPengguna': (context) => DetailPengguna(
              dp: ModalRoute.of(context)?.settings.arguments as DataPengguna),
          '/detailMenu': (context) => DetailMenu(
              dataMenu: ModalRoute.of(context)?.settings.arguments as DataMenu),
        },
      ),
    );
  }
}
