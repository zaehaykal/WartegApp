import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warteg/service/provider/GetMenuProvider.dart';
import 'package:warteg/service/util/State.dart';

class ListMenuPage extends StatefulWidget {
  const ListMenuPage({super.key});

  @override
  State<ListMenuPage> createState() => _ListMenuPageState();
}

class _ListMenuPageState extends State<ListMenuPage> {
  @override
  Widget build(BuildContext context) {
    final urlImage = 'http://10.0.2.2/warteg/public/uploads';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          Text(MediaQuery.of(context).size.height.toString()),
          Text("    "),
          Text(MediaQuery.of(context).size.width.toString())
        ],
      ),
      body: Consumer<GetMenuProvider>(
        builder: (context, value, child) {
          if (value.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (value.state == ResultState.hasData) {
            final data = value.getMenuResponse.data;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detailMenu',
                        arguments: data[index],
                      );
                    },

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.network(
                                  '$urlImage/${data[index].foto}',
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(data[index].nama),
                              Text(data[index].harga),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // child: Column(
                    //   children: [
                    //     ListTile(
                    //         contentPadding: const EdgeInsets.all(8.0),
                    //         leading: const Icon(
                    //             Icons.airline_seat_individual_suite_sharp),
                    //         title: Text(
                    //           data[index].nama,
                    //           style:
                    //               const TextStyle(fontWeight: FontWeight.bold),
                    //         ),
                    //         subtitle: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //                 'Harga: ${data[index].harga}'), // Menampilkan harga
                    //             Text(
                    //                 'Kategori: ${data[index].kategori}'), // Menampilkan kategori
                    //           ],
                    //         ),
                    //         trailing: const Wrap(
                    //           children: [
                    //             Icon(Icons.update),
                    //             Icon(Icons.delete)
                    //           ],
                    //         )),
                    //     const Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: Divider(
                    //         thickness: 1,
                    //         color: Colors.grey,
                    //       ),
                    //     )
                    //   ],
                    // ),
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
