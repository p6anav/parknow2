import 'package:flutter/material.dart';
import 'home/home.dart'; // Your Home page
import 'servi/service.dart'; // Your Service page
import 'joinus/joinus.dart'; // Your Join Us page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 37, 34, 34), // Set the background color of the Scaffold
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0), // Set the AppBar height to 0
          child: AppBar(
            elevation: 0,
          ),
        ),
        body: ContainerWithTabs(),
      ),
    );
  }
}

class ContainerWithTabs extends StatefulWidget {
  @override
  _ContainerWithTabsState createState() => _ContainerWithTabsState();
}

class _ContainerWithTabsState extends State<ContainerWithTabs> {
  String _currentTab = 'Home';
  final Map<String, GlobalKey> _tabKeys = {
    'Home': GlobalKey(),
    'Service': GlobalKey(),
    'Join Us': GlobalKey(),
  };

  double _indicatorPosition = 0.0;
  double _indicatorWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min, // Ensure the Column fits its content
                  crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTabButton('Home'),
                        SizedBox(width: 80), // Add horizontal space
                        _buildTabButton('Service'),
                        SizedBox(width: 80), // Add horizontal space
                        _buildTabButton('Join Us'),
                      ],
                    ),
                    if (_currentTab == 'Home')
                      SizedBox(height: 0.5), // Space between text and bar if Home is selected
                    if (_currentTab == 'Home')
                      Container(
                        height: 4.0,
                        width: 60.0, // Adjust the width as needed
                        color: Color.fromARGB(255, 235, 231, 11), // Green bar color
                        margin: EdgeInsets.only(right: 250), // Adjust the left margin to move the bar to the left
                      ),
                    if (_currentTab == 'Service')
                      SizedBox(height: 0.5), // Space between text and bar if Service is selected
                    if (_currentTab == 'Service')
                      Container(
                        height: 4.0,
                        width: 60.0, // Adjust the width as needed
                        color: Color.fromARGB(255, 235, 231, 11),// Green bar color
                        margin: EdgeInsets.only(right: 0), // Adjust the left margin to move the bar to the left
                      ),
                    if (_currentTab == 'Join Us')
                      SizedBox(height: 0.5), // Space between text and bar if Join Us is selected
                    if (_currentTab == 'Join Us')
                      Container(
                        height: 4.0,
                        width: 60.0, // Adjust the width as needed
                        color:  Color.fromARGB(255, 235, 231, 11), // Green bar color
                        margin: EdgeInsets.only(left: 250), // Adjust the left margin to move the bar to the left
                      ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: _buildContent(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTabButton(String tabName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentTab = tabName;
          _updateIndicator();
        });
      },
      child: AnimatedScale(
        scale: _currentTab == tabName ? 1.2 : 1.0, // Scale up when selected
        duration: Duration(milliseconds: 300), // Duration of the animation
        curve: Curves.easeInOut, // Curve for smooth scaling
        child: Container(
          key: _tabKeys[tabName],
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            tabName,
            style: TextStyle(
              color: _currentTab == tabName ? Colors.white : Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _updateIndicator() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = _tabKeys[_currentTab]!
          .currentContext!
          .findRenderObject() as RenderBox;
      final size = renderBox.size;
      final offset = renderBox.localToGlobal(Offset.zero);

      setState(() {
        _indicatorWidth = size.width;
        _indicatorPosition = offset.dx;
      });
    });
  }

  Widget _buildContent() {
    switch (_currentTab) {
      case 'Service':
        return ServiceScreen(); // Navigate to service.dart
      case 'Join Us':
        return JoinUsScreen(); // Navigate to joinus.dart
      default:
        return HomeScreen(
            isSelected: _currentTab == 'Home'); // Pass the selected state
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateIndicator();
    });
  }
}

