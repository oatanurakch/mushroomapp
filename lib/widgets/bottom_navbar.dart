import 'package:flutter/material.dart';
import 'package:mushroomapp/utility/constant.dart';

import 'package:mushroomapp/pages/overview_page.dart';
import 'package:mushroomapp/pages/utility_page.dart';
import 'package:mushroomapp/pages/ozone_page.dart';
// import 'package:mushroomapp/pages/biotech_page.dart';
import 'package:mushroomapp/widgets/navbar.dart';

class BTNavigation extends StatefulWidget {
  const BTNavigation({super.key});

  @override
  State<BTNavigation> createState() => _BTNavigationState();
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  CustomAppBar(
      {this.height = kToolbarHeight *
          2}); // Default height is twice the standard AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Mushroom App',
        style: TextStyle(
          fontFamily: 'JetBrainsMono',
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        color: Colors.blueAccent, // Customize as needed
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height) * 0.7;
}

class _BTNavigationState extends State<BTNavigation> {
  int _selectedIndex = 0;
  List _WidgetOptions = [
    OverviewPage(),
    UtilityPage(),
    OzonePage(),
  ];

  // Ontap items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: ColorPalette[4],
        //   elevation: 0,
        //   title: Text(
        //     'Mushroom App',
        //     style: TextStyle(
        //       fontFamily: 'JetBrainsMono',
        //     ),
        //   ),

        // ),
        // appBar: CustomAppBar(height: 120.0),
        drawer: NavBarWidget(),
        body: Center(
          child: _WidgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0,
          selectedFontSize: 15,
          selectedIconTheme: IconThemeData(
            color: GreenGradientToneLTToRB.colors[0],
            size: 25,
          ),
          selectedItemColor: GreenGradientToneLTToRB.colors[0],
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/home.png'),
                size: 20,
              ),
              label: 'Overview',
              backgroundColor: ColorPalette[0],
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/tools.png'),
                size: 20,
              ),
              label: 'Utility',
              backgroundColor: ColorPalette[0],
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/spray.png'),
                size: 20,
              ),
              label: 'Spray & Biotech',
              backgroundColor: ColorPalette[0],
            ),
          ],
        ),
      ),
    );
  }
}
