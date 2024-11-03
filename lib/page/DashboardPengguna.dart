// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warteg/service/model/UserLoginResponse.dart';
import 'package:warteg/service/provider/UserLoginProvider.dart';
import 'package:warteg/page/LoginPage.dart';

class DashboardPengguna extends StatefulWidget {
  final DataUserLogin dataPengguna;
  const DashboardPengguna({super.key, required this.dataPengguna});

  @override
  State<DashboardPengguna> createState() => _DashboardPenggunaState();
}

class _DashboardPenggunaState extends State<DashboardPengguna> {
  @override
  Widget build(BuildContext context) {
    Provider.of<UserLoginProvider>(context);

    const urlImage = 'http://10.0.2.2/warteg/public/uploads';
    return Scaffold(
      backgroundColor: Colors.blue[50],
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("data"),
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
            ListTile(
              title: const Text('Data Pengguna'),
              onTap: () {
                Navigator.pushNamed(context, '/loginPage');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.dataPengguna.name),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage('$urlImage/${widget.dataPengguna.foto}'),
                child: widget.dataPengguna.foto.isEmpty
                    ? Text(
                        widget.dataPengguna.name[0].toUpperCase(),
                        style: const TextStyle(fontSize: 24, color: Colors.white),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              scrollDirection: Axis.horizontal,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
          ),
          const SizedBox(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 50, height: 50, child: Container()),
                    SizedBox(width: 50, height: 50, child: Container()),
                    SizedBox(width: 50, height: 50, child: Container()),
                    SizedBox(width: 50, height: 50, child: Container()),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _logout,
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

void _logout() async {
  try {
    final loginProvider = Provider.of<UserLoginProvider>(context, listen: false);
    bool response = await loginProvider.logout(); // Menggunakan Future<bool>

    if (!mounted) return; // Periksa jika widget masih mounted

    if (response) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logout berhasil')),
      );

      // Navigasi kembali ke halaman login tanpa memungkinkan pengguna untuk kembali
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false, // Menghapus semua rute sebelumnya
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logout gagal, silakan coba lagi')),
      );
    }
  } catch (e) {
    if (!mounted) return; // Periksa jika widget masih mounted
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal logout: $e')),
    );
  }
}

}
