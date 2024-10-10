import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'tomtom_routing_service.dart'; // Your routing service
import 'TomTomGeocodingService.dart'; // Your geocoding service
import 'package:flutter_svg/flutter_svg.dart'; // For SVG support

class TomTomMapWithRoute extends StatefulWidget {
  @override
  _TomTomMapWithRouteState createState() => _TomTomMapWithRouteState();
}

class _TomTomMapWithRouteState extends State<TomTomMapWithRoute> {
  List<LatLng> _routeCoordinates = [];
  final TomTomRoutingService routingService = TomTomRoutingService();
  final TomTomGeocodingService geocodingService = TomTomGeocodingService();

  LatLng _startLocation = LatLng(9.3170, 76.6320); // Chengannur default
  LatLng _endLocation = LatLng(0, 0); // Thrissur default
  LatLng? _draggedLocation; // Store the dragged location
  bool _isLoading = false; // Loading state
  final MapController _mapController = MapController(); // Map controller

  final TextEditingController _locationController = TextEditingController();
  bool _isStartLocation = true; // To differentiate between start and end
  final double _fixedZoomLevel = 16.5; // Set your desired fixed zoom level

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
      List<LatLng> route =
          await routingService.getRoute(_startLocation, _endLocation);
      setState(() {
        _routeCoordinates = route; // Update the route coordinates
        _mapController.move(_startLocation, _fixedZoomLevel); // Move to start location with fixed zoom
      });
    } catch (e) {
      
    } finally {
      setState(() {
        _isLoading = false; // Clear loading state
      });
    }
  }

  Future<void> _searchLocation() async {
    final location = _locationController.text.trim();

    // Check if the location is "College of Engineering Chengannur"
    if (location.toLowerCase() == "college of engineering chengannur") {
      // Update start location
      setState(() {
        _startLocation = LatLng(9.317058442294602, 76.61729140748656);
        // Move and zoom to the location without fetching route first
        _mapController.move(_startLocation, _fixedZoomLevel);
      });
      await Future.delayed(Duration(milliseconds: 100)); // Wait briefly before getting the route
      await _getRoute(); // Fetch the route
      return; // Exit the function
    }

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
      // Move to new location and fetch route afterward
      _mapController.move(_startLocation, _fixedZoomLevel); // Move to the new start location with fixed zoom
      await _getRoute(); // Fetch the updated route
    } catch (e) {
      _showErrorDialog(
          'Error converting place name to coordinates: ${e.toString()}');
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

  void _onDragUpdate(LatLng updatedLocation) {
    setState(() {
      _draggedLocation = updatedLocation; // Update dragged location
    });
  }

  void _saveLocation() {
    if (_draggedLocation != null) {
      print(
          'Saved Latitude: ${_draggedLocation!.latitude}, Longitude: ${_draggedLocation!.longitude}');
      // You can store this in a database or perform another action here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location saved successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No location to save!')),
      );
    }
  }

  void _clearRoute() {
    setState(() {
      _routeCoordinates.clear(); // Clear the route coordinates
      _locationController.clear(); // Clear the location input
      _startLocation =
          LatLng(9.3170, 76.6320); // Reset to default start location
      _endLocation = LatLng(10.5276, 76.2144); // Reset to default end location
    });
    _getRoute(); // Fetch the route again
  }

  void _toggleLocationType() {
    setState(() {
      _isStartLocation =
          !_isStartLocation; // Toggle between start and end location
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
                    onSubmitted: (value) =>
                        _searchLocation(), // Search location on submit
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
              initialZoom: _fixedZoomLevel, // Set initial zoom level
              onTap: (tapPosition, point) {
                _onDragUpdate(point); // Handle dragging of pin
              },
              // Listen for zoom changes
              onPositionChanged: (position, hasGesture) {
                if (position.zoom < _fixedZoomLevel) {
                  // If the zoom level goes below the fixed level, set it back
                  _mapController.move(position.center, _fixedZoomLevel);
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.tomtom.com/map/1/tile/basic/main/{z}/{x}/{y}.png?key=8CKwch3uCDAuLbcrffLiAx8IdhU9bGKS", // Replace with your TomTom API key
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
              if (_draggedLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 20.0,
                      height: 20.0,
                      point: _draggedLocation!,
                      child: SvgPicture.asset(
                        'lib/assets/icons/location.svg', // Your custom SVG pin image
                        width: 30,
                        height: 30,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          if (_isLoading) // Show loading indicator
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _toggleLocationType,
            tooltip: 'Toggle Start/End Location',
            child: Icon(Icons.swap_horiz),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _saveLocation,
            tooltip: 'Save Location',
            child: Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
