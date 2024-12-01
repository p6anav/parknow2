import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sidebar extends StatefulWidget {
  final Function(int) onItemSelected;
  final int selectedIndex;

  Sidebar({
    required this.onItemSelected,
    required this.selectedIndex,
  });

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 8, 8, 192).withOpacity(0.5),
            offset: Offset(4, 4),
            blurRadius: 5.0,
            spreadRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: SvgPicture.asset(
                      'lib/assets/icons/logo.svg', // Replace with your logo path
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 70),
                    child: Text(
                      'MENU',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(15),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: buildMenuItem(
                    iconPath: 'lib/assets/icons/dash.svg',
                    text: 'Dashboard',
                    index: 0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: buildMenuItem(
                    iconPath: 'lib/assets/icons/parkig.svg',
                    text: 'Parking space',
                    index: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: buildMenuItem(
                    iconPath: 'lib/assets/icons/his.svg',
                    text: 'History',
                    index: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: buildMenuItem(
                    iconPath: 'lib/assets/icons/action.svg',
                    text: 'Action',
                    index: 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String iconPath,
    required String text,
    required int index,
  }) {
    bool isSelected = widget.selectedIndex == index;
    bool isHovered = hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          hoveredIndex = -1;
        });
      },
      child: GestureDetector(
        onTap: () {
          widget.onItemSelected(index);
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? Color.fromARGB(255, 8, 8, 192)
                : isHovered
                    ? Color.fromARGB(255, 8, 8, 192)
                    : Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 22.0,
                height: 22.0,
                color: isSelected || isHovered ? Colors.white : Colors.black,
              ),
              SizedBox(width: 16),
              Text(
                text,
                style: TextStyle(
                  color: isSelected || isHovered ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
