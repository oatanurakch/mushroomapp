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
  bool _isSwitchOnOffTimeLED = false;
  bool _isSwitchOnOffTimeLAMP = false;
  bool _isSwitchLAMP = false;
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
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildControlLED('Blue LED', 'assets/icons/led.png')
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildControlLAMP('LAMP', 'assets/icons/light.png')
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
      height: MediaQuery.of(context).size.height * 0.27,
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
      height: MediaQuery.of(context).size.height * 0.27,
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
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
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
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
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
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      'Auto Mode',
                      style: TextStyle(fontFamily: 'JetBrainsMono'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                8.0,
                              ), // Add some padding so the border doesn't touch the text
                              decoration: BoxDecoration(
                                color: ColorPalette[0],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: ColorPalette[
                                      2], // Set this to the color you want
                                  width: 2, // Set this to the width you want
                                ),
                              ),
                              child: Text(
                                "6:30 AM",
                                style: TextStyle(fontFamily: 'JetBrainsMono'),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                8.0,
                              ), // Add some padding so the border doesn't touch the text
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorPalette[0],
                                border: Border.all(
                                  color: ColorPalette[
                                      2], // Set this to the color you want
                                  width: 2, // Set this to the width you want
                                ),
                              ),
                              child: Text(
                                "7:30 AM",
                                style: TextStyle(fontFamily: 'JetBrainsMono'),
                              ),
                            ),
                            Switch(
                              value: _isSwitchOnOffTimeLED,
                              activeColor: ColorPalette[3],
                              activeTrackColor: ColorPalette[1],
                              inactiveTrackColor: Colors.white,
                              inactiveThumbColor: ColorPalette[3],
                              onChanged: (value) {
                                setState(() {
                                  _isSwitchOnOffTimeLED = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          print(pickedTime
                              .format(context)); // Replace this with your code
                        }
                      },
                      child: Text(
                        '+ Add Time',
                        style: TextStyle(
                          fontFamily: 'JetBrainsMono',
                          color: ColorPalette[3],
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorPalette[0]),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: ColorPalette[2],
                                width: 2,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildControlLAMP(title, pathIcons) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
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
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
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
                          value: _isSwitchLAMP,
                          activeColor: ColorPalette[2],
                          inactiveThumbColor: ColorPalette[3],
                          thumbColor: WidgetStatePropertyAll(ColorPalette[3]),
                          activeTrackColor: ColorPalette[1],
                          onChanged: (value) {
                            setState(() {
                              _isSwitchLAMP = value;
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
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      'Auto Mode',
                      style: TextStyle(fontFamily: 'JetBrainsMono'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                8.0,
                              ), // Add some padding so the border doesn't touch the text
                              decoration: BoxDecoration(
                                color: ColorPalette[0],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: ColorPalette[
                                      2], // Set this to the color you want
                                  width: 2, // Set this to the width you want
                                ),
                              ),
                              child: Text(
                                "6:30 AM",
                                style: TextStyle(fontFamily: 'JetBrainsMono'),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                8.0,
                              ), // Add some padding so the border doesn't touch the text
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorPalette[0],
                                border: Border.all(
                                  color: ColorPalette[
                                      2], // Set this to the color you want
                                  width: 2, // Set this to the width you want
                                ),
                              ),
                              child: Text(
                                "7:30 AM",
                                style: TextStyle(fontFamily: 'JetBrainsMono'),
                              ),
                            ),
                            Switch(
                              value: _isSwitchOnOffTimeLAMP,
                              activeColor: ColorPalette[3],
                              activeTrackColor: ColorPalette[1],
                              inactiveTrackColor: Colors.white,
                              inactiveThumbColor: ColorPalette[3],
                              onChanged: (value) {
                                setState(() {
                                  _isSwitchOnOffTimeLAMP = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          print(pickedTime
                              .format(context)); // Replace this with your code
                        }
                      },
                      child: Text(
                        '+ Add Time',
                        style: TextStyle(
                          fontFamily: 'JetBrainsMono',
                          color: ColorPalette[3],
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorPalette[0]),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: ColorPalette[2],
                                width: 2,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
