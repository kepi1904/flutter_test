import 'package:demo_multi_provider/cart.dart';
import 'package:demo_multi_provider/money.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Money>(
          create: (context) => Money(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Consumer<Money>(
          builder: (context, money, _) => Consumer<Cart>(
            builder: (context, cart, _) => FloatingActionButton(
              onPressed: () {
                if (money.balance >= 500) {
                  cart.quantity += 1;
                  money.balance -= 500;
                } else {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "NO BALANCE",
                    desc: "Sorry your balance is too low!",
                    buttons: [
                      DialogButton(
                        child: const Text(
                          "TOP UP",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          money.balance = 10000;
                          Navigator.pop(context);
                        },
                        width: 120,
                      )
                    ],
                  ).show();
                }
              },
              child: const Icon(Icons.add_shopping_cart),
              backgroundColor: Colors.green,
            ),
          ),
        ),
        appBar: AppBar(
            title: const Text('Demo Multi Provider'),
            backgroundColor: Colors.green),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Balance: '),
                  Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Consumer<Money>(
                        builder: (context, money, _) =>
                            Text("IDR " + money.balance.toString()),
                      ),
                    ),
                    height: 30,
                    width: 150,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green[100],
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Consumer<Cart>(
                    builder: (context, cart, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Oppo Reno 7 (IDR 500) x " + cart.quantity.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text("IDR " + (500 * cart.quantity).toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                ),
                height: 30,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
