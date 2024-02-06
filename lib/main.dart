import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TorchController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Torch'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<bool?>(
                  future: controller.isTorchActive,
                  builder: (_, snapshot) {
                    final snapshotData = snapshot.data ?? false;

                    if (snapshot.connectionState == ConnectionState.done)
                      return Text(
                          'Is torch on? ${snapshotData ? 'Yes!' : 'No :('}',
                      style: TextStyle(fontSize: 15),
                      );

                    return Container();
                  }),
              SizedBox(height: 20,),
              MaterialButton(
                  child: Container(
                    width: 100,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Torch',
                      style: TextStyle(fontSize: 20),
                      )),
                  onPressed: () {
                    controller.toggle(intensity: 1);
                    setState(() {});
                  }),
            ],
          ),
        ),
      ),
    );
  }
}