import 'package:flutter/material.dart';
import 'package:mushroomapp/utility/constant.dart';

class OzonePage extends StatefulWidget {
  const OzonePage({super.key});

  @override
  State<OzonePage> createState() => _OzonePageState();
}

class _OzonePageState extends State<OzonePage> {
  bool _isNiFer = false;
  bool _isOzone = false;
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
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        // color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                "Nitrogen Fertilizer",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 28),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                              child: Image.asset(
                                'assets/icons/nitrogen.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Switch(
                                  value: _isNiFer,
                                  activeColor: ColorPalette[3],
                                  activeTrackColor: Colors.lightBlueAccent,
                                  inactiveTrackColor: Colors.white,
                                  inactiveThumbColor: ColorPalette[3],
                                  onChanged: (value) {
                                    setState(() {
                                      _isNiFer = value;
                                    });
                                  },
                                ),
                                Text("Nitrogen Fertilizer On/Off")
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Text(
                                "Spray",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 36),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Image.asset(
                                  'assets/icons/humid.png',
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  fit: BoxFit.cover,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.93,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/icons/ozone_2.png',
                          width: MediaQuery.of(context).size.width * 0.3,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.5,
                          // color: Colors.lightBlue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: Text(
                                  "Ozone Treatment",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28),
                                ),
                              ),
                              Text(
                                "Ozone Level",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text("100 ppm", style: TextStyle(fontSize: 32)),
                              Text(
                                "2 ppm",
                                style: TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: Row(
                                  children: [
                                    Switch(
                                      value: _isOzone,
                                      activeColor: ColorPalette[3],
                                      activeTrackColor: Colors.lightBlueAccent,
                                      inactiveTrackColor: Colors.white,
                                      inactiveThumbColor: ColorPalette[3],
                                      onChanged: (value) {
                                        setState(() {
                                          _isOzone = value;
                                        });
                                      },
                                    ),
                                    Text("on/off")
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
