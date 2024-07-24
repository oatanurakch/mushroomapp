import 'package:flutter/material.dart';
import 'package:mushroomapp/utility/constant.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette[0],
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(
                8.0,
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'สวัสดีคุณอนุรักษ์ ชูศรี',
                      style: TextStyle(
                        fontFamily: 'Maehongson',
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                    Text(
                      'ยินดีต้อนรับเข้าสู่ Mushroom App',
                      style: TextStyle(
                        fontFamily: 'Maehongson',
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
