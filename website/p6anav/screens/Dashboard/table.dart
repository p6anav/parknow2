import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import the profile page

class TableContainer extends StatefulWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final double borderRadius;

  TableContainer({
    this.width = double.infinity,
    this.height = 400.0,
    this.backgroundColor = const Color.fromARGB(255, 254, 254, 255),
    this.borderRadius = 16.0,
  });

  @override
  _TableContainerState createState() => _TableContainerState();
}

class _TableContainerState extends State<TableContainer> {
  // Mock data
  List<Map<String, dynamic>> _data = List.generate(
    100,
    (index) => {
      'username': 'User ${index + 1}',
      'type': index % 2 == 0 ? 'Car' : 'Bike',
      'numberPlate': 'KL${(index % 10)}${(index % 100).toString().padLeft(2, '0')}K${(index % 10000).toString().padLeft(4, '0')}',
      'time': '2024-08-${(index + 1).toString().padLeft(2, '0')} 12:${(index % 24).toString().padLeft(2, '0')}:00',
    },
  );

  bool _ascending = true; // Sorting state
  int _currentPage = 0;
  int _rowsPerPage = 10; // Rows per page

  void _sortData(String column) {
    setState(() {
      if (_ascending) {
        _data.sort((a, b) => a[column].compareTo(b[column]));
      } else {
        _data.sort((a, b) => b[column].compareTo(a[column]));
      }
      _ascending = !_ascending;
    });
  }

  void _navigateToProfile(String username) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(name: username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the start and end indices for the current page
    final start = _currentPage * _rowsPerPage;
    final end = start + _rowsPerPage;
    final dataSlice = _data.sublist(start, end < _data.length ? end : _data.length);

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 255, 255), // Blue shadow with opacity
             // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text('Username', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Type', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Number Plate', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Time', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          Divider(color: Colors.white70),

          // Rows
          Expanded(
            child: ListView.builder(
              itemCount: dataSlice.length,
              itemBuilder: (context, index) {
                final item = dataSlice[index];
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(child: Text(item['username'])),
                      Expanded(child: Text(item['type'])),
                      Expanded(child: Text(item['numberPlate'])),
                      Expanded(child: Text(item['time'])),
                    ],
                  ),
                  onTap: () => _navigateToProfile(item['username']),
                );
              },
            ),
          ),

          // Pagination
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Page ${_currentPage + 1}'),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: _currentPage > 0
                          ? () {
                              setState(() {
                                _currentPage--;
                              });
                            }
                          : null,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: (start + _rowsPerPage < _data.length)
                          ? () {
                              setState(() {
                                _currentPage++;
                              });
                            }
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
