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
              title: const Text('Data Menu'),
              onTap: () {
                Navigator.pushNamed(context, '/listMenu');
              },
            ),
            ListTile(
              title: const Text('Buat Menu'),
              onTap: () {
                Navigator.pushNamed(context, '/createMenu');
              },
            ),
            ListTile(
              title: const Text('Data Pengguna'),
              onTap: () {
                Navigator.pushNamed(context, '/listPengguna');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: const Text("He'd have you all unravel at the"),
            ),
          ],
        ),
      ),
    );
  }
}
