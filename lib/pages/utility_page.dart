import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'package:mushroomapp/utility/constant.dart';

class UtilityPage extends StatefulWidget {
  const UtilityPage({super.key});

  @override
  State<UtilityPage> createState() => _UtilityPageState();
}

class _UtilityPageState extends State<UtilityPage> {
  double _value = 40.0;
  int _valueRPM = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorPalette[0],
          body: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                // margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                                child: SfSliderTheme(
                                  data: SfSliderThemeData(
                                    tooltipBackgroundColor: ColorPalette[3],
                                    thumbColor: ColorPalette[3],
                                    activeTrackColor: ColorPalette[2],
                                    activeLabelStyle: TextStyle(
                                      color: ColorPalette[2],
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontFamily: 'JetBrainsMono',
                                    ),
                                    inactiveLabelStyle: TextStyle(
                                      color: ColorPalette[3],
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontFamily: 'JetBrainsMono',
                                    ),
                                  ),
                                  child: SfSlider.vertical(
                                      min: 0.0,
                                      max: 100.0,
                                      value: _value,
                                      interval: 20,
                                      showTicks: true,
                                      stepSize: 1,
                                      showLabels: true,
                                      enableTooltip: true,
                                      tooltipPosition:
                                          SliderTooltipPosition.left,
                                      onChanged: (dynamic values) {
                                        setState(() {
                                          _value = values;
                                          _valueRPM =
                                              (values * 1800 / 100).round();
                                        });
                                      }),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'ตั้งค่าความเร็ว',
                                    style: TextStyle(
                                      fontFamily: 'Maehongson',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${_value.toStringAsFixed(0)} %',
                                    style: TextStyle(
                                      fontFamily: 'JetBrainsMono',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'ความเร็วพัดลม',
                                    style: TextStyle(
                                      fontFamily: 'Maehongson',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '$_valueRPM',
                                    style: TextStyle(
                                      fontFamily: 'JetBrainsMono',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/icons/fan.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Card(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(
              //         15.0), // Set this to the border radius you want
              //   ),
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
              //         child: SfSliderTheme(
              //           data: SfSliderThemeData(
              //             tooltipBackgroundColor: ColorPalette[2],
              //           ),
              //           child: SfSlider.vertical(
              //               activeColor: ColorPalette[2],
              //               min: 0.0,
              //               max: 100.0,
              //               value: _value,
              //               interval: 20,
              //               showTicks: true,
              //               stepSize: 1,
              //               showLabels: true,
              //               enableTooltip: true,
              //               tooltipPosition: SliderTooltipPosition.right,
              //               onChanged: (dynamic values) {
              //                 setState(() {
              //                   _value = values;
              //                 });
              //               }),
              //         ),
              //       ),
              //       Image.asset('assets/icons/fan.png'),
              //     ],
              //   ),
              // ),
            ],
          )),
    );
  }
}
