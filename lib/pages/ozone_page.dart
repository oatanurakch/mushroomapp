import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mushroomapp/utility/constant.dart';
import 'package:cart_stepper/cart_stepper.dart';

class OzonePage extends StatefulWidget {
  const OzonePage({super.key});

  @override
  State<OzonePage> createState() => _OzonePageState();
}

class _OzonePageState extends State<OzonePage> {
  bool _isNiFer = false;
  bool _isOzone = false;
  bool _isSwitchTime1 = false;
  bool _isSwitchTime2 = false;
  int _SoakTime = 30;
  int _TargetPPM = 105;
  int _ActualPPM = 92;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height -
                  kBottomNavigationBarHeight * 2,
              color: ColorPalette[0],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.35,
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        // color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Nitrogen Fertilizer",
                              style: TextStyle(
                                fontFamily: 'JetbrainsMono',
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Center(
                              child: Image.asset(
                                'assets/icons/nitrogen.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ON',
                                  style:
                                      TextStyle(fontFamily: 'JetbrainsMono,'),
                                ),
                                Switch(
                                  value: _isNiFer,
                                  activeColor: ColorPalette[3],
                                  activeTrackColor: Colors.green[300],
                                  inactiveTrackColor: Colors.white,
                                  inactiveThumbColor: ColorPalette[3],
                                  onChanged: (value) {
                                    setState(() {
                                      _isNiFer = value;
                                    });
                                  },
                                ),
                                Text(
                                  'OFF',
                                  style:
                                      TextStyle(fontFamily: 'JetbrainsMono,'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Spray",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                'assets/icons/humid.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          width:
                                              2, // Set this to the width you want
                                        ),
                                      ),
                                      child: Text(
                                        "6:30 AM",
                                        style: TextStyle(
                                            fontFamily: 'JetBrainsMono',
                                            fontSize: 14),
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
                                          width:
                                              2, // Set this to the width you want
                                        ),
                                      ),
                                      child: Text(
                                        "7:30 AM",
                                        style: TextStyle(
                                            fontFamily: 'JetBrainsMono',
                                            fontSize: 14),
                                      ),
                                    ),
                                    Switch(
                                      value: _isSwitchTime2,
                                      activeColor: ColorPalette[3],
                                      activeTrackColor: Colors.green[300],
                                      inactiveTrackColor: Colors.white,
                                      inactiveThumbColor: ColorPalette[3],
                                      onChanged: (value) {
                                        setState(() {
                                          _isSwitchTime2 = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          width:
                                              2, // Set this to the width you want
                                        ),
                                      ),
                                      child: Text(
                                        "2:00 PM",
                                        style: TextStyle(
                                            fontFamily: 'JetBrainsMono',
                                            fontSize: 14),
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
                                          width:
                                              2, // Set this to the width you want
                                        ),
                                      ),
                                      child: Text(
                                        "4:30 PM",
                                        style: TextStyle(
                                            fontFamily: 'JetBrainsMono',
                                            fontSize: 14),
                                      ),
                                    ),
                                    Switch(
                                      value: _isSwitchTime1,
                                      activeColor: ColorPalette[3],
                                      activeTrackColor: Colors.green[300],
                                      inactiveTrackColor: Colors.white,
                                      inactiveThumbColor: ColorPalette[3],
                                      onChanged: (value) {
                                        setState(() {
                                          _isSwitchTime1 = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );

                                    if (pickedTime != null) {
                                      print(pickedTime.format(
                                          context)); // Replace this with your code
                                    }
                                  },
                                  child: Text(
                                    'New Schedule',
                                    style: TextStyle(
                                      fontFamily: 'JetBrainsMono',
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(ColorPalette[0]),
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                          color: ColorPalette[2],
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.93,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Image.asset(
                              'assets/icons/ozone_2.png',
                              width: MediaQuery.of(context).size.width * 0.3,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.5,
                            // color: Colors.lightBlue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: Text(
                                    "Ozone Treatment",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                ),
                                Text(
                                  "Ozone Level",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontFamily: 'JetbrainsMono',
                                  ),
                                ),
                                Text(
                                  "92 ppm",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    fontFamily: 'JetbrainsMono',
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Text(
                                            'Target PPM: ',
                                            style: TextStyle(
                                              fontFamily: 'JetbrainsMono,',
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        CartStepperInt(
                                          stepper: 1,
                                          style: CartStepperStyle(
                                            textStyle: TextStyle(
                                              fontFamily: 'JetBrainsMono',
                                            ),
                                            activeForegroundColor: Colors.black,
                                            activeBackgroundColor:
                                                ColorPalette[0],
                                          ),
                                          elevation: 7,
                                          value: _TargetPPM,
                                          didChangeCount: (count) {
                                            setState(() {
                                              _TargetPPM =
                                                  count < 1 ? count = 1 : count;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: Text(
                                              'Soak time: ',
                                              style: TextStyle(
                                                fontFamily: 'JetbrainsMono,',
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                          CartStepperInt(
                                            stepper: 1,
                                            style: CartStepperStyle(
                                              textStyle: TextStyle(
                                                fontFamily: 'JetBrainsMono',
                                              ),
                                              activeForegroundColor:
                                                  Colors.black,
                                              activeBackgroundColor:
                                                  ColorPalette[0],
                                            ),
                                            elevation: 7,
                                            value: _SoakTime,
                                            didChangeCount: (count) {
                                              setState(() {
                                                _SoakTime = count < 1
                                                    ? count = 1
                                                    : count;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          _buildTextButton('Start',
                                              Colors.white, Colors.green),
                                          _buildTextButton(
                                              'Stop', Colors.white, Colors.red),
                                          _buildTextButton('Flush',
                                              Colors.white, Colors.orange),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTextButton(text, textColor, bgColor) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'JetBrainsMono',
          color: textColor,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(bgColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
              color: bgColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
