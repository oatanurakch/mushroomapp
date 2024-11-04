import 'package:flutter/material.dart';
import 'package:mushroomapp/utility/constant.dart';
import 'package:mushroomapp/utility/globals.dart' as globals;

import 'package:auto_size_text/auto_size_text.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final redKey = GlobalKey();

  Color getTextcolor(dynamic value) {
    if (value is int || value is double) {
      return Colors.black;
    } else {
      if (value == "ON") {
        return ColorOnOff[0];
      } else {
        return ColorOnOff[1];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                      gradient: GreenGradientToneLTToRB,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  child: Center(
                    child: Text(
                      'Mushroom App',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Prompt',
                          fontSize: 42,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    8.0,
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.01,
                        // ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                              child: Center(
                                child: Text(
                                  'House #1',
                                  style: TextStyle(
                                    fontFamily: 'Maehongson',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.07,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/mushroom.png'),
                                      fit: BoxFit.fill,
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
                            _buildTagLabel(
                              'assets/icons/fan.png',
                              "Fan RPM",
                              "${((globals.PWMVal.toInt() * 1800) / 100).round()}",
                              [10, null, null, 10],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  _buildCardItems(
                                    'assets/icons/airflow.png',
                                    'Air Flow',
                                    'CFM',
                                    42,
                                  ),
                                  _buildCardItems(
                                    'assets/icons/power.png',
                                    'Power Consumption',
                                    'Watt',
                                    1822,
                                  ),
                                  _buildCardItems(
                                    'assets/icons/energyconsumption.png',
                                    'Energy',
                                    'kWh',
                                    0.8,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  _buildCardItems(
                                    'assets/icons/light.png',
                                    'ไฟส่องสว่าง',
                                    null,
                                    'OFF',
                                  ),
                                  _buildCardItems(
                                    'assets/icons/led.png',
                                    'LED สีน้ำเงิน',
                                    null,
                                    'ON',
                                  ),
                                  _buildCardItems(
                                      'assets/icons/uv.png', 'UV', null, 'ON')
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
          color: Colors.white.withOpacity(0.6),
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

  _buildCardItems(pathImg, itemName, unit, value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Container(
        decoration: BoxDecoration(
            // gradient: GreenGradientToneLTToRB,
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.12,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(pathImg,
                      width: MediaQuery.of(context).size.height * 0.04),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.3,
                    // color: Colors.amber,
                    child: Center(
                      child: AutoSizeText(
                        itemName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          // fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Prompt',
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                // color: Colors.amber,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      value.toString(),
                      style: TextStyle(
                        color: getTextcolor(value),
                        // color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Prompt',
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text(
                      unit != null ? unit : '',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        color: Color(0xFFA0A0A0),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Prompt',
                      ),
                    ),
                  ],
                ),
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  // _buildCardItems(pathImg, itemName, unit, value) {
  //   return Card(
  //     color: ColorPalette[4],
  //     child: Container(
  //       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
  //       child: Row(
  //         children: [
  //           Image.asset(pathImg,
  //               width: MediaQuery.of(context).size.height * 0.06),
  //           SizedBox(width: 10),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 itemName,
  //                 style: TextStyle(
  //                   fontSize: MediaQuery.of(context).size.height * 0.025,
  //                   fontWeight: FontWeight.bold,
  //                   fontFamily: 'Maehongson',
  //                 ),
  //               ),
  //               Text(
  //                 unit != null ? unit : '',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.w600,
  //                   fontFamily: 'JetbrainsMono',
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Spacer(),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 value.toString(),
  //                 style: TextStyle(
  //                   fontSize: MediaQuery.of(context).size.height * 0.03,
  //                   fontWeight: FontWeight.bold,
  //                   fontFamily: 'JetbrainsMono',
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
