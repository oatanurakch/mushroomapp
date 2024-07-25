import 'package:flutter/material.dart';
import 'package:mushroomapp/utility/constant.dart';

class OzonePage extends StatefulWidget {
  const OzonePage({super.key});

  @override
  State<OzonePage> createState() => _OzonePageState();
}

class _OzonePageState extends State<OzonePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - kBottomNavigationBarHeight,
              color: Colors.grey[350],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height*0.3,
                        width: MediaQuery.sizeOf(context).width*0.3,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                        ),
                        // color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                              child: Text("Nitrogen Fertilizer",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),textAlign: TextAlign.center,),),
                            Image.asset('assets/icons/nitrogen.png',width: MediaQuery.of(context).size.width*0.1)
                          ],),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height*0.3,
                        width: MediaQuery.sizeOf(context).width*0.5,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 0, 50),
                              child: Text("Spray",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),textAlign: TextAlign.center,),),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,0,0,0),
                              child: Image.asset('assets/icons/humid.png',width: MediaQuery.of(context).size.width*0.1),
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
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
