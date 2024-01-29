import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Provider/catelog.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final catelog = Provider.of<CatelogProvider>(context);
    print("Cart build");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catelog.items.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height - 150,
                      width: double.infinity,
                      child: const Center(
                        child: Text("Cart is empty"),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height - 150,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              height: 60,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Vx.randomColor,
                              ),
                            ),
                            title: Text(catelog.items[index]["title"]),
                            subtitle: Text(catelog.items[index]["subtitle"]),
                            trailing: const Icon(
                              Icons.remove,
                              color: Vx.black,
                            ).onTap(() {
                              catelog.remove(catelog.items[index]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${catelog.items[index]["title"]} removed",
                                  ),
                                  duration: const Duration(seconds: 2),
                                  showCloseIcon: true,
                                  closeIconColor: Colors.red,
                                ),
                              );
                            }),
                          );
                        },
                        itemCount: catelog.items.length,
                      ),
                    ),
              20.heightBox,

              Container(
                padding: const EdgeInsets.all(20),
                child: Consumer(
                  builder: (context, value, child) =>
                      "Total : ${catelog.total}"
                      .text
                      .size(20)
                      .color(Vx.black)
                      .make(),
                ),
              )

              //  Text("Total : ${catelog.total}"),
            ],
          ),
        ));
  }
}
