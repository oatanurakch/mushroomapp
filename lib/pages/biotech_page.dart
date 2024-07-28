import 'package:flutter/material.dart';
import 'package:mushroomapp/utility/constant.dart';
import 'package:cart_stepper/cart_stepper.dart';

class BiotechPage extends StatefulWidget {
  const BiotechPage({super.key});

  @override
  State<BiotechPage> createState() => _BiotechPageState();
}

class _BiotechPageState extends State<BiotechPage> {
  final double padLeft = 10.0;
  final double padTop = 10.0;
  final double padRight = 10.0;
  final double padBottom = 0.0;
  int _counterBiotech = 1;
  int _counterWater = 1;
  String dropdownValue = 'Mitophagus-TM';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette[0],
        body: ListView(
          padding: EdgeInsets.fromLTRB(padLeft, padTop, padRight, padBottom),
          children: [
            Expanded(
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
                      'Biotech Page',
                      style: TextStyle(
                        fontFamily: 'JetBrainsMono',
                        fontSize: MediaQuery.of(context).size.width * 0.05,
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
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorPalette[0],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: ColorPalette[
                                    2], // Set this to the color you want
                                width: 1, // Set this to the width you want
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  borderRadius: BorderRadius.circular(20),
                                  dropdownColor: ColorPalette[0],
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    fontFamily: 'Maehongson',
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'สารชีวภาพ (mL)',
                                    style: TextStyle(
                                      fontFamily: 'Maehongson',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
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
                                      activeBackgroundColor: ColorPalette[0],
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
                                    height: MediaQuery.of(context).size.width *
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
                                      fontSize:
                                          MediaQuery.of(context).size.width *
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
                                      activeBackgroundColor: ColorPalette[0],
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  MediaQuery.of(context).size.width * 0.05,
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
                                      MediaQuery.of(context).size.width * 0.04,
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
