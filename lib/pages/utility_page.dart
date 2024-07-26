import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

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
  @override
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
                      _buildContainerItem(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildContainerItem() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
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
                  interval: 20,
                  showTicks: true,
                  stepSize: 1,
                  showLabels: true,
                  enableTooltip: true,
                  tooltipPosition: SliderTooltipPosition.left,
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'ตั้งค่าความเร็ว',
                style: TextStyle(
                  fontFamily: 'Maehongson',
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${_value.toStringAsFixed(0)} %',
                style: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ความเร็วพัดลม',
                style: TextStyle(
                  fontFamily: 'Maehongson',
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$_valueRPM',
                style: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'assets/icons/fan.png',
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
