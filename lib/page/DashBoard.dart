import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text("Drawer"),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pushNamed(context, '/listMenu');
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pushNamed(context, '/createMenu');
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Selamat Datang Di Warteg"),
              Text("Ingin Pesan ?"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/listMenu");
                  },
                  child: Text("List Menu"))
            ],
          ),
        ));
  }
}
