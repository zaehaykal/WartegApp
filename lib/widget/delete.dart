// lib/widgets/delete_icon_button.dart

import 'package:flutter/material.dart';
import 'package:warteg/service/api/ApiPengguna.dart';

class DeleteIconButton extends StatelessWidget {
  final int penggunaId;

  const DeleteIconButton({Key? key, required this.penggunaId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        ApiPengguna apiPengguna = ApiPengguna();
        bool success = await apiPengguna.deletePengguna(penggunaId);

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Pengguna berhasil dihapus')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal menghapus pengguna')),
          );
        }
      },
      icon: Icon(
        Icons.delete,
        color: Colors.redAccent,
      ),
    );
  }
}
