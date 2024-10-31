import "package:flutter/material.dart";
import "package:warteg/service/model/GetPenggunaResponse.dart";

class DetailPengguna extends StatelessWidget {
  final DataPengguna dp;

  const DetailPengguna({Key? key, required this.dp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final urlImage = 'http://10.0.2.2/warteg/public/uploads';
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },  
              icon: const Icon(Icons.arrow_back))),
      body: Column(
        children: [
          Text(dp.nama),
          Flexible(flex: 2, child: Image.network('$urlImage/${dp.foto}'))
        ],
      ),
    );
  }
}
