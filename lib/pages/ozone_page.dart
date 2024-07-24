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
        appBar: AppBar(
          title: Text("Ozone Control",style: TextStyle(fontFamily: 'JetBrainsMono',fontWeight: FontWeight.bold, fontSize: 36)),
        ),
        body: ListView(
          children: [

          ],
        ),
      ),
    );
  }
}
