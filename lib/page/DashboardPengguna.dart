import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:warteg/service/api/ApiUser.dart';
import 'package:warteg/service/model/UserLoginResponse.dart';

class DashboardPengguna extends StatefulWidget {
  final DataUserLogin dataPengguna;
  const DashboardPengguna({Key? key, required this.dataPengguna})
      : super(key: key);

  @override
  State<DashboardPengguna> createState() => _DashboardPenggunaState();
}

class _DashboardPenggunaState extends State<DashboardPengguna> {
  @override
  Widget build(BuildContext context) {
    final urlImage = 'http://10.0.2.2/warteg/public/uploads';
    return Scaffold(backgroundColor: Colors.blue[50],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
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
              radius: 50, // Anda dapat mengubah radius sesuai kebutuhan
              backgroundImage: NetworkImage(
                  '$urlImage/${widget.dataPengguna.foto}'), // Menggunakan NetworkImage untuk menampilkan gambar dari URL
              child: widget.dataPengguna.foto.isEmpty
                  ? Text(
                      widget.dataPengguna.name[0]
                          .toUpperCase(), // Menampilkan huruf pertama dari nama jika foto tidak ada
                      style: TextStyle(
                          fontSize: 24, color: Colors.white), // Gaya teks
                    )
                  : null, // Jika ada foto, tidak perlu menampilkan teks
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
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              scrollDirection: Axis.horizontal,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
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
          const SizedBox(height: 20), // Jarak antara tombol
          ElevatedButton(
            onPressed: _logout,
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  final Apiuser _apiUser = Apiuser();
  String? _token; // Simpan token untuk keperluan otorisasi

  void _logout() async {
    if (_token != null) {
      try {
        await _apiUser.logout(_token!);
        setState(() {
          _token = null; // Reset token setelah logout
        });
        // Tampilkan pesan sukses atau navigasi kembali ke halaman login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout berhasil')),
        );

        await Navigator.pushNamed(context, '/loginPage');
      } catch (e) {
        // Tangani kesalahan saat logout
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal logout: $e')),
        );
      }
    }
  }
}
