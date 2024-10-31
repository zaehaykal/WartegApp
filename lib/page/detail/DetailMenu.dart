import 'package:flutter/material.dart';
import 'package:warteg/service/model/GetMenuResponse.dart';

class DetailMenu extends StatelessWidget {
  final DataMenu dataMenu;
  const DetailMenu({Key? key, required this.dataMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final urlImage = 'http://10.0.2.2/warteg/public/uploads';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network('$urlImage/${dataMenu.foto}'),
            ),
            const SizedBox(),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      dataMenu.nama,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      dataMenu.kategori,
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
