import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String hintText;
  final double height;
  final double borderRadius;
  final double width;
  final Color backgroundColor;
  final Color shadowColor;
  final Color iconColor;
  final EdgeInsetsGeometry padding;

  const SearchBarWidget({
    Key? key,
    required this.controller,
    this.onChanged,
    this.hintText = 'Registration number or Booking number.',
    this.height = 50.0,
    this.borderRadius = 20.0,
    this.width = 700.0,
    this.backgroundColor = const Color.fromARGB(236, 255, 255, 255),
    this.shadowColor = const Color.fromARGB(0, 40, 0, 135),
    this.iconColor = Colors.black54,
    this.padding = const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0), // Padding around the search bar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          // The Search Bar
          Expanded(
            child: SizedBox(
              height: height,
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    prefixIcon: Icon(Icons.search, color: iconColor),
                    contentPadding: EdgeInsets.only( bottom: 13),
                  ),
                   textAlign: TextAlign.center, 
                ),
              ),
            ),
          ),
          SizedBox(width: 16), // Space between search bar and icons

          // Local SVG Icons
          SvgPicture.asset(
            'lib/assets/icons/bell.svg',
            width: 24,
            height: 24,
          ),
          SizedBox(width: 16),
          SvgPicture.asset(
            'lib/assets/icons/location.svg',
            width: 24,
            height: 24,
          ),
          SizedBox(width: 16),
          SvgPicture.asset(
            'lib/assets/icons/setting.svg',
            width: 24,
            height: 24,
          ),
          SizedBox(width: 16),
          SvgPicture.asset(
            'lib/assets/icons/help.svg',
            width: 24,
            height: 24,
          ),
           SizedBox(width: 16),
          SvgPicture.asset(
            'lib/assets/icons/profile1.svg',
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
