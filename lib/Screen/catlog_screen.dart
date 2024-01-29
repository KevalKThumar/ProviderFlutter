import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/catelog.provider.dart';
import 'package:provider_learn/Screen/cart_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class CatlogPage extends StatelessWidget {
  CatlogPage({super.key});

  final data = [
    {'title': "Test0", 'subtitle': "test0", "price": 100},
    {'title': "Test1", 'subtitle': "test1", "price": 200},
    {'title': "Test2", 'subtitle': "test2", "price": 300},
    {'title': "Test3", 'subtitle': "test3", "price": 400},
    {'title': "Test4", 'subtitle': "test4", "price": 500},
    {'title': "Test5", 'subtitle': "test5", "price": 600},
    {'title': "Test6", 'subtitle': "test6", "price": 700},
    {'title': "Test7", 'subtitle': "test7", "price": 800},
    {'title': "Test8", 'subtitle': "test8", "price": 900},
    {'title': "Test9", 'subtitle': "test9", "price": 1000},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen(data: data),
        theme: ThemeData(primarySwatch: Colors.brown),
        routes: {
          '/cart': (context) => const CartPage(),
        });
  }
}

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.data,
  });

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalog"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                icon: const Icon(Icons.add_shopping_cart),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Consumer<CatelogProvider>(
                  builder: (context, catelogProvider, child) {
                return ListTile(
                  title: Text(
                    "${data[index]['title']}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Vx.black,
                    ),
                  ),
                  leading: Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Vx.randomColor,
                    ),
                  ).onTap(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${data[index]['title']}"),
                        duration: const Duration(seconds: 1),
                        showCloseIcon: true,
                        closeIconColor: Colors.red,
                        padding: const EdgeInsets.all(10),
                        shape: const BeveledRectangleBorder(),
                      ),
                    );
                  }),
                  trailing: const Icon(Icons.add, color: Vx.black).onTap(() {
                    catelogProvider.add(data[index]);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${data[index]['title']} added to cart"),
                        duration: const Duration(seconds: 2),
                        showCloseIcon: true,
                        closeIconColor: Colors.red,
                        padding: const EdgeInsets.all(10),
                        shape: const BeveledRectangleBorder(),
                      ),
                    );
                  }),
                  subtitle: Text("${data[index]['subtitle']}"),
                  isThreeLine: true,
                  dense: true,
                  tileColor: Colors.amber,
                  hoverColor: Colors.grey[200],
                  selected: true,
                  enabled: true,
                );
              });
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          child: const Icon(Icons.add_shopping_cart),
        ));
  }
}
