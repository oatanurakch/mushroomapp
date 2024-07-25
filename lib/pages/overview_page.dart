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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/mushroom.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.1),
                                      BlendMode.darken))),
                        ),
                        _buildTagLabel(
                          'assets/icons/temp.png',
                          "อุณหภูมิ °C",
                          "22.8 ",
                          [10, 10, null, null],
                        ),
                        _buildTagLabel(
                          'assets/icons/humid.png',
                          "ความชื้น %RH",
                          "90",
                          [null, null, 10, 10],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'ข้อมูลภายในโรงเพาะเห็ด',
                            style: TextStyle(
                              fontFamily: 'Maehongson',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                          _buildCardItems(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build labe stack with image
  // margin = [left, top, right, bottom]
  _buildTagLabel(pathImg, topic, value, List<dynamic> margin) {
    return Positioned(
      left: margin[0] != null ? margin[0].toDouble() : null,
      top: margin[1] != null ? margin[1].toDouble() : null,
      right: margin[2] != null ? margin[2].toDouble() : null,
      bottom: margin[3] != null ? margin[3].toDouble() : null,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10), // Add this line
        ),
        child: Row(
          children: [
            Image.asset(
              pathImg,
              width: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  topic,
                  style: TextStyle(
                    fontFamily: 'Maehongson',
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: 'JetbrainsMono',
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildCardItems() {
    return Card(
      color: ColorPalette[1],
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          children: [
            Image.asset('assets/icons/fan.png'),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fan Speed',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'JetbrainsMono',
                  ),
                ),
                Text(
                  'RPM',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'JetbrainsMono',
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1480',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.05,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'JetbrainsMono',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
