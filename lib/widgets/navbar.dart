import 'package:flutter/material.dart';
import 'package:mushroomapp/utility/constant.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: GreenGradientTone4Zone,
        ),
        child: ListView(
          children: [
            // UserAccountsDrawerHeader(
            //   currentAccountPicture: CircleAvatar(
            //     backgroundColor: Colors.white,
            //     child: Text(
            //       'A',
            //       style: TextStyle(fontSize: 40),
            //     ),
            //   ),
            //   decoration: BoxDecoration(
            //     gradient: GreenGradientToneLTToRB,
            //   ),
            //   accountName: Text(
            //     'Anurak Choosri',
            //     style: TextStyle(
            //       fontFamily: 'JetBrainsMono',
            //       color: Colors.black,
            //     ),
            //   ),
            //   accountEmail: Text(
            //     'd6500450@g.sut.ac.th',
            //     style: TextStyle(
            //       fontFamily: 'JetBrainsMono',
            //       color: Colors.black,
            //       fontSize: MediaQuery.of(context).size.width * 0.04,
            //     ),
            //   ),
            // ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              decoration: BoxDecoration(
                gradient: GreenGradientToneLTToRB,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Text(
                      'A',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Anurak Choosri',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      color: Colors.black,
                      fontSize: 20
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'd6500450@g.sut.ac.th',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
                'assets/icons/package.png', 'โรงบ่มก้อนเชื้อ', [5, 10, 5, 0]),
            _buildDrawerItem(
                'assets/icons/mushroom.png', 'โรงเพาะเชื้อ', [5, 5, 5, 0]),
          ],
        ),
      ),
    );
  }

  _buildDrawerItem(
    String pathImg,
    String item,
    List<double> margin,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(margin[0], margin[1], margin[2], margin[3]),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Image.asset(
              pathImg,
              width: 30,
            ),
            title: Text(
              item,
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Maehongson',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
