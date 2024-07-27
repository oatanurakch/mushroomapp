import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'dart:math';

import 'package:mushroomapp/utility/globals.dart' as globals;
import 'package:mushroomapp/utility/constant.dart';

class UtilityPage extends StatefulWidget {
  const UtilityPage({super.key});

  @override
  State<UtilityPage> createState() => _UtilityPageState();
}

class _UtilityPageState extends State<UtilityPage> {
  double _value = 40;
  int _valueRPM = ((globals.PWMVal.toInt() * 1800) / 100).round();
  bool _isSwitchCoolingPad = false;
  bool _isSwitchBlueLED = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette[0],
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildContainerItemFanControl(),
                            _buildControlCoolingPad(
                                'Cooling Pad', 'assets/icons/evap.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildControlLED(
                                'Blue LED', 'assets/icons/led.png'),
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
      ),
    );
  }

  _buildContainerItemFanControl() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            'Fan',
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SfSliderTheme(
                data: SfSliderThemeData(
                  tooltipBackgroundColor: ColorPalette[3],
                  thumbColor: ColorPalette[3],
                  activeTrackColor: ColorPalette[2],
                  activeLabelStyle: TextStyle(
                    color: ColorPalette[2],
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'JetBrainsMono',
                  ),
                  inactiveLabelStyle: TextStyle(
                    color: ColorPalette[3],
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'JetBrainsMono',
                  ),
                ),
                child: SfSlider.vertical(
                    min: 0.0,
                    max: 100.0,
                    value: _value,
                    interval: 25,
                    showTicks: true,
                    stepSize: 1,
                    showLabels: true,
                    // enableTooltip: true,
                    // tooltipPosition: SliderTooltipPosition.left,
                    // Update the value of _valueRPM when the slider value changes
                    onChangeEnd: (dynamic values) {
                      globals.PWMVal = values;
                    },
                    onChanged: (dynamic values) {
                      setState(() {
                        _value = values;
                        _valueRPM = (values * 1800 / 100).round();
                      });
                    }),
              ),
              Column(
                children: [
                  Transform.rotate(
                    angle: pi / 1,
                    child: Image.asset(
                      'assets/icons/fan.png',
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                  Text(
                    '${_value.toStringAsFixed(0)} %',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                  Text(
                    '$_valueRPM',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildControlCoolingPad(title, pathIcons) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            pathIcons,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OFF',
                style: TextStyle(fontFamily: 'JetBrainsMono'),
              ),
              Switch(
                value: _isSwitchCoolingPad,
                activeColor: ColorPalette[3],
                activeTrackColor: ColorPalette[1],
                inactiveTrackColor: Colors.white,
                inactiveThumbColor: ColorPalette[3],
                onChanged: (value) {
                  setState(() {
                    _isSwitchCoolingPad = value;
                  });
                },
              ),
              Text(
                'ON',
                style: TextStyle(fontFamily: 'JetBrainsMono'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildControlLED(title, pathIcons) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    'Manual Mode',
                    style: TextStyle(fontFamily: 'JetBrainsMono'),
                  ),
                  Image.asset(
                    pathIcons,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OFF',
                        style: TextStyle(fontFamily: 'JetBrainsMono'),
                      ),
                      Switch(
                        value: _isSwitchBlueLED,
                        activeColor: ColorPalette[2],
                        inactiveThumbColor: ColorPalette[3],
                        thumbColor: WidgetStatePropertyAll(ColorPalette[3]),
                        activeTrackColor: ColorPalette[1],
                        onChanged: (value) {
                          setState(() {
                            _isSwitchBlueLED = value;
                          });
                        },
                      ),
                      Text(
                        'ON',
                        style: TextStyle(fontFamily: 'JetBrainsMono'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    'Auto Mode',
                    style: TextStyle(fontFamily: 'JetBrainsMono'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: ColorPalette[1],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add Schedule',
                      style: TextStyle(
                        fontFamily: 'JetBrainsMono',
                        color: ColorPalette[3],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.17,
                    decoration: BoxDecoration(
                      color: ColorPalette[0],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Table(
                            border: TableBorder.all(
                              color: ColorPalette[3],
                              width: 2,
                            ),
                            children: [
                              TableRow(
                                children: [
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 32,
                                          width: 32,
                                          color: ColorPalette[2],
                                        ),
                                        Text(
                                          'ON',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 32,
                                          width: 32,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          'OFF',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '27/07/67',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '8:00',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '27/07/67',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '10:30',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '27/07/67',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '12:00',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '27/07/67',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '14:30',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '27/07/67',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '16:00',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '27/07/67',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '18:00',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '28/07/67',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '7:00',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '28/07/67',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '8:30',
                                          style: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
