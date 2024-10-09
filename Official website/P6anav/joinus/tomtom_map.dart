import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'tomtom_routing_service.dart'; // Your routing service
import 'TomTomGeocodingService.dart'; // Your geocoding service

class TomTomMapWithRoute extends StatefulWidget {
  @override
  _TomTomMapWithRouteState createState() => _TomTomMapWithRouteState();
}

class _TomTomMapWithRouteState extends State<TomTomMapWithRoute> {
  List<LatLng> _routeCoordinates = [];
  final TomTomRoutingService routingService = TomTomRoutingService();
  final TomTomGeocodingService geocodingService = TomTomGeocodingService();

  LatLng _startLocation = LatLng(9.3170, 76.6320); // Chengannur
  LatLng _endLocation = LatLng(10.5276, 76.2144);  // Thrissur
  LatLng? _lastTappedLocation; // Store the last tapped location
  bool _isLoading = false; // Loading state
  final MapController _mapController = MapController(); // Map controller

  final TextEditingController _locationController = TextEditingController();
  bool _isStartLocation = true; // To differentiate between start and end

  @override
  void initState() {
    super.initState();
    _getRoute(); // Get the initial route
  }

  Future<void> _getRoute() async {
    setState(() {
      _isLoading = true; // Set loading state
    });

    try {
      List<LatLng> route = await routingService.getRoute(_startLocation, _endLocation);
      setState(() {
        _routeCoordinates = route; // Update the route coordinates
        _mapController.move(_startLocation, 10.0); // Move to start location
      });
    } catch (e) {
      _showErrorDialog('Error fetching route: ${e.toString()}');
    } finally {
      setState(() {
        _isLoading = false; // Clear loading state
      });
    }
  }

  Future<void> _searchLocation() async {
    final location = _locationController.text.trim();

    if (location.isEmpty) {
      _showErrorDialog('Please enter a location.');
      return;
    }

    try {
      LatLng coordinates = await geocodingService.getCoordinates(location);
      if (_isStartLocation) {
        _startLocation = coordinates;
      } else {
        _endLocation = coordinates;
      }
      await _getRoute(); // Fetch the updated route
    } catch (e) {
      _showErrorDialog('Error converting place name to coordinates: ${e.toString()}');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _onTap(LatLng tappedLocation) {
    setState(() {
      _lastTappedLocation = tappedLocation; // Update last tapped location
    });
    print('Tapped Latitude: ${tappedLocation.latitude}, Longitude: ${tappedLocation.longitude}');
  }

  void _clearRoute() {
    setState(() {
      _routeCoordinates.clear(); // Clear the route coordinates
      _locationController.clear(); // Clear the location input
      _startLocation = LatLng(9.3170, 76.6320); // Reset to default start location
      _endLocation = LatLng(10.5276, 76.2144); // Reset to default end location
    });
    _getRoute(); // Fetch the route again
  }

  void _toggleLocationType() {
    setState(() {
      _isStartLocation = !_isStartLocation; // Toggle between start and end location
      _locationController.clear(); // Clear the input field for new location
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: _clearRoute, // Clear route button
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      hintText: "Enter location name",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) => _searchLocation(), // Search location on submit
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchLocation, // Update route on button press
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _startLocation, // Set initial center
              initialZoom: 17, // Set initial zoom level
              onTap: (tapPosition, point) {
                _onTap(point); // Handle tap event to drop pin
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/{z}/{x}/{y}.png?key=8CKwch3uCDAuLbcrffLiAx8IdhU9bGKS", // Replace with your TomTom API key
                subdomains: ['a', 'b', 'c'], // Subdomains for tile caching
              ),
              if (_routeCoordinates.isNotEmpty) // Draw polyline only if there are coordinates
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routeCoordinates,
                      strokeWidth: 4.0,
                      color: Colors.red, // Color for the route line
                    ),
                  ],
                ),
            ],
          ),
          if (_isLoading) // Show loading indicator
            Center(
              child: CircularProgressIndicator(),
            ),
          if (_lastTappedLocation != null)
            CustomPaint(
              painter: PinPainter(_lastTappedLocation!),
              size: Size.infinite,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleLocationType,
        tooltip: 'Toggle Start/End Location',
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}

class PinPainter extends CustomPainter {
  final LatLng location;

  PinPainter(this.location);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;

    // Draw the pin as a simple circle at the tapped location
    final center = Offset(size.width / 2, size.height / 2); // Use center of the canvas for the pin
    canvas.drawCircle(center, 10, paint);
  }

  @override
  bool shouldRepaint(covariant PinPainter oldDelegate) {
    return oldDelegate.location != location; // Only repaint if location has changed
  }
}
