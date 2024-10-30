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
  int _counterBiotech = 1;
  int _counterWater = 1;
  String dropdownValueBio = 'Mitophagus-TM';
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width,
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
                              height: MediaQuery.of(context).size.height * 0.1,
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
                                  TimeOfDay? pickedTime = await showTimePicker(
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
                                      borderRadius: BorderRadius.circular(18.0),
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
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Biotech',
                            style: TextStyle(
                              fontFamily: 'JetBrainsMono',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'เลือกสารชีวภาพ',
                                  style: TextStyle(
                                    fontFamily: 'Maehongson',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorPalette[0],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: ColorPalette[
                                          2], // Set this to the color you want
                                      width:
                                          1, // Set this to the width you want
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: dropdownValueBio,
                                        borderRadius: BorderRadius.circular(20),
                                        dropdownColor: ColorPalette[0],
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          fontFamily: 'Maehongson',
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValueBio = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Mitophagus-TM',
                                          'Bacillus thuringiensis',
                                          'Biotech 1',
                                          'Biotech 2',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'สารชีวภาพ (mL)',
                                          style: TextStyle(
                                            fontFamily: 'Maehongson',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
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
                                          value: _counterBiotech,
                                          didChangeCount: (count) {
                                            setState(() {
                                              _counterBiotech =
                                                  count < 1 ? count = 1 : count;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                            fontFamily: 'JetBrainsMono',
                                            fontSize: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'น้ำ (L)',
                                          style: TextStyle(
                                            fontFamily: 'Maehongson',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
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
                                          value: _counterWater,
                                          didChangeCount: (count) {
                                            setState(() {
                                              _counterWater =
                                                  count < 1 ? count = 1 : count;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildTextButton(
                                        'Start', Colors.white, Colors.green),
                                    _buildTextButton(
                                        'Stop', Colors.white, Colors.red),
                                    _buildTextButton('Normal Function',
                                        Colors.white, Colors.yellow[900]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Status :',
                                  style: TextStyle(
                                    fontFamily: 'JetBrainsMono',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.amber[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Prepairing . . .',
                                      style: TextStyle(
                                        fontFamily: 'JetBrainsMono',
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ),
                                  ),
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
