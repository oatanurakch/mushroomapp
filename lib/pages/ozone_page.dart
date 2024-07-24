import 'package:flutter/material.dart';
import 'package:mushroomapp/utility/constant.dart';

class OzonePage extends StatefulWidget {
  const OzonePage({super.key});

  @override
  State<OzonePage> createState() => _OzonePageState();
}

class _OzonePageState extends State<OzonePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            children: [
              Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text("Hello1"),Text("Hello2")],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text("Hello3"),Text("Hello4")],)
                  ],)
              ),
              ),
            ]
          ),
        ),
      )
    );
  }
}