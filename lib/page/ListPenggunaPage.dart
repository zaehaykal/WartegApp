import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warteg/service/provider/GetPenggunaProvider.dart';
import 'package:warteg/service/util/State.dart';
import 'package:warteg/widget/delete.dart';

class ListPenggunaPage extends StatelessWidget {
  final urlImage = 'http://10.0.2.2/warteg/public/uploads';
  const ListPenggunaPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Text(MediaQuery.of(context).size.height.toString())],
      ),
      body: Consumer<GetPenggunaProvider>(
        builder: (context, value, child) {
          if (value.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (value.state == ResultState.hasData) {
            final data = value.getPenggunaResponse.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detailPengguna',
                        arguments: data[index],
                      );
                    },
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          leading: const Icon(Icons.supervised_user_circle_rounded),
                          title: Text(
                            data[index].nama,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Harga: ${data[index].nohp}'), // Menampilkan harga
                              Text(
                                  'Kategori: ${data[index].alamat}'), // Menampilkan kategori
                            ],
                          ),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  // Aksi jika tombol di sebelah kanan ditekan
                                },
                              ),
                              DeleteIconButton(penggunaId: data[index].id),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  );
                });
          } else if (value.state == ResultState.error) {
            return const Text("Tidak ada data yang ditampilkan");
          }
          return Text(value.message);
        },
      ),
    );
  }
}
