import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warteg/service/provider/PostMenuProvider.dart';
import 'package:image_picker/image_picker.dart';

class CreateMenuPage extends StatefulWidget {
  const CreateMenuPage({super.key});

  @override
  State<CreateMenuPage> createState() => _CreateMenuPageState();
}

class _CreateMenuPageState extends State<CreateMenuPage> {
  final nama = TextEditingController();
  final harga = TextEditingController();
  final kategori = TextEditingController();
  File? _image; // Menyimpan file gambar

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path); // Simpan gambar yang dipilih
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Buat Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nama',
                ),
                controller: nama,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Harga',
                ),
                controller: harga,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Kategori',
                ),
                controller: kategori,
              ),
            ),
            // Tombol untuk memilih gambar
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pilih Foto'),
            ),
            // Menampilkan gambar yang dipilih
            if (_image != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.file(
                  _image!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            // Tombol untuk mengirim data
            ElevatedButton(
              onPressed: () async {
                // Kirim data ke provider, termasuk gambar
                Provider.of<Postmenuprovider>(context, listen: false).PostDataMenu(
                  nama.text,
                  harga.text,
                  kategori.text,
                  _image != null ? _image!.path : '', // Pass path image or empty string
                );
              },
              child: const Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}
