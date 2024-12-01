
import 'package:flutter/material.dart';
import 'widget/sidebar.dart';
import 'screens/Dashboard/dashboard.dart';
//import 'screens/Dashboard/cards.dart';
import 'widget/searchbar.dart';
import 'screens/parkingview/parking.dart'; // Import your ParkingScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidebar Example with Hover & Select Effects',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedIndex = 0; // Set default selection to Dashboard (index 0)
  int hoveredIndex = -1;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Sidebar(
            onItemSelected: (index) {
              setState(() {
                selectedIndex = index;
                if (index == -1) {
                  hoveredIndex = -1;
                }
              });
            },
            selectedIndex: selectedIndex ?? -1,
          ),
          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Search Bar at the top
                SearchBarWidget(
                  controller: _searchController,
                  onChanged: (query) {
                    // Handle search query changes
                    print('Search query: $query');
                  },
                ),
                // Expanded content area
                Expanded(child: getSelectedScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedScreen() {
    switch (selectedIndex) {
      case 0:
        return DashboardScreen();
      case 1:
        return ParkingScreen(); // Add the parking screen here
      // Add more cases for other screens
      default:
        return Center(child: Text(''));
    }
  }
}
