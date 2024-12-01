import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final Color color;
  final String number;
  final String title;
  final String date;
  final String percentageChange;
  final Color numberColor;
  final Color titleColor;
  final Color dateColor;
  final Color percentageColor;

  DashboardCard({
    this.color =const Color.fromARGB(237, 24, 0, 181),
    this.number = '0',
    this.title = '',
    this.date = '',
    this.percentageChange = '',
    this.numberColor = Colors.green,
    this.titleColor = Colors.white,
    this.dateColor = Colors.white,
    this.percentageColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Number at the top left
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: numberColor,
                ),
              ),
            ),
            // Percentage change at the top right
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                decoration: BoxDecoration(
                  color: percentageColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  percentageChange,
                  style: TextStyle(
                    fontSize: 16,
                    color: percentageColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Title (e.g., "Available Parking Spaces")
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Date at the bottom left
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: dateColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
