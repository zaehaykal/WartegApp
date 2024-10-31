import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warteg/service/provider/GetMenuProvider.dart';
import 'package:warteg/service/util/State.dart';

class ListMenuPage extends StatelessWidget {
  const ListMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: Consumer<GetMenuProvider>(
        builder: (context, value, child) {
          if (value.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (value.state == ResultState.hasData) {
            final data = value.getMenuResponse.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(data[index].nama),
                        trailing: Text(data[index].harga),
                        subtitle: Text(data[index].nama),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  );
                });
          } else {
            return Text(value.message);
          }
        },
      ),
    );
  }
}
