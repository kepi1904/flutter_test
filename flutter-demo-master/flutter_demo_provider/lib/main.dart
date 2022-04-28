import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/application_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                'Demo Provider',
                style: TextStyle(color: applicationColor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    margin: const EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: applicationColor.color,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text("AB"),
                      ),
                      Consumer<ApplicationColor>(
                        builder: (context, applicationColor, _) => Switch(
                          value: applicationColor.isLightBlue,
                          onChanged: (newValue) {
                            applicationColor.isLightBlue = newValue;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text("LB"),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
