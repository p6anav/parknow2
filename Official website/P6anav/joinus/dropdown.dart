import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CustomDropdownField extends StatefulWidget {
  final String label;
  final List<String> items;
  final String? currentValue;
  final ValueChanged<String?> onChanged;
  final double spaceBelow;

  const CustomDropdownField({
    required this.label,
    required this.items,
    required this.currentValue,
    required this.onChanged,
    this.spaceBelow = 8.0,
  });

  @override
  _CustomDropdownFieldState createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  final GlobalKey _key = GlobalKey();
  bool _isDropdownOpen = false;
  String? _hoveredItem;
  OverlayEntry? _overlayEntry;

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
    if (_isDropdownOpen) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    final double dropdownHeight = 200.0; // Adjust this based on your dropdown's height

    double topPosition = offset.dy + size.height + 25; // Space below the trigger widget

    final double screenHeight = MediaQuery.of(context).size.height;
    if (topPosition + dropdownHeight > screenHeight) {
      topPosition = offset.dy - dropdownHeight - 25; // Space above the trigger widget
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: topPosition,
        left: offset.dx,
        width: size.width,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(143, 17, 17, 17),
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Color.fromARGB(255, 111, 108, 108).withOpacity(0.5), // Border color
                width: 1.8, // Border width
              ),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 8)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.items.map((item) {
                return MouseRegion(
                  onEnter: (_) => setState(() => _hoveredItem = item),
                  onExit: (_) => setState(() => _hoveredItem = null),
                  child: GestureDetector(
                    onTap: () {
                      widget.onChanged(item);
                      _toggleDropdown(); // Close dropdown after selection
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                      margin: EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        color: widget.currentValue == item
                            ? Colors.green
                            : _hoveredItem == item
                                ? const Color.fromARGB(255, 158, 158, 159)
                                : const Color.fromARGB(255, 54, 51, 51),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item,
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'This is a paragraph for $item. It provides additional information about the role. ',
                                  style: TextStyle(color: Colors.white70, fontSize: 14.0),
                                ),
                                TextSpan(
                                  text: 'Read more',
                                  style: TextStyle(color: const Color.fromARGB(255, 33, 243, 72), fontSize: 14.0, decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    _removeDropdown(); // Ensure dropdown is hidden
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: Container(
                                          width: 0.4 * MediaQuery.of(context).size.width, // Responsive width
                                          padding: EdgeInsets.all(16.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[800],
                                            borderRadius: BorderRadius.circular(12.0),
                                            border: Border.all(
                                             color:  const Color.fromARGB(255, 54, 51, 51), // Border color
                                              width: 1.8, // Border width
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'More about $item',
                                                style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(height: 12.0),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: _getDetailedInfo(item),
                                              ),
                                              SizedBox(height: 16.0),
                                              Align(
                                                alignment: Alignment.bottomRight,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Close'),
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.green, // Background color
                                                    onPrimary: Colors.white, // Text color
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ).then((_) {
                                      // Re-open dropdown if it was open before dialog
                                      if (_isDropdownOpen) {
                                        _showDropdown();
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)!.insert(_overlayEntry!);
  }

  void _removeDropdown() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  List<Widget> _getDetailedInfo(String item) {
    // Debug print to check item value
    print('Selected item: $item');

    switch (item) {
      case 'Admin':
        return [
          Text('• View Live Parking: Admin can monitor all ongoing parking activities in real-time.', style: TextStyle(color: Colors.white70, fontSize: 14.0)),
          SizedBox(height: 4.0),
          Text('• View Parking History: Admin can filter and view historical parking data by specific dates.', style: TextStyle(color: Colors.white70, fontSize: 14.0)),
          SizedBox(height: 4.0),
          Text('• Expand User Entries: Admin can expand individual entries in the dashboard to see detailed information about a user and their parking history.', style: TextStyle(color: Colors.white70, fontSize: 14.0)),
          SizedBox(height: 4.0),
          Text('• Blacklist Theft Vehicle: Admin can blacklist vehicles flagged for suspicious or illegal activity.', style: TextStyle(color: Colors.white70, fontSize: 14.0)),
          SizedBox(height: 4.0),
          Text('• Remove User: Admin can remove users from the system if necessary.', style: TextStyle(color: Colors.white70, fontSize: 14.0)),
          SizedBox(height: 4.0),
          Text('• Manual Slot Allocation: Admin can manually allocate parking slots in case of system issues or user requests.', style: TextStyle(color: Colors.white70, fontSize: 14.0)),
        ];

      default:
        return [
          Text('• View Parking History: Normal users can view their own parking history.', style: TextStyle(color: Colors.white70, fontSize: 14.0)),
          SizedBox(height: 4.0),
          Text('• Manage Payments: Normal users can handle their own payments and transactions.', style: TextStyle(color: Colors.white70, fontSize: 14.0)),
          SizedBox(height: 4.0),
          Text('• Reserve Parking Spots: Normal users can reserve parking spots in advance.', style: TextStyle(color: Colors.white70, fontSize: 14.0)),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: screenWidth > 600 ? 18.0 : 16.0, color: Colors.white),
        ),
        SizedBox(height: widget.spaceBelow),
        GestureDetector(
          key: _key,
          onTap: _toggleDropdown,
          child: Container(
            width: screenWidth * 0.8, // Responsive width
            height: screenHeight > 600 ? 55.0 : 45.0, // Responsive height
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: const Color.fromARGB(255, 81, 81, 81).withOpacity(0.5), // Border color
                width: 0.5, // Border width
              ),
            ),
            child: Text(
              widget.currentValue ?? 'Select an option',
              style: TextStyle(color: Colors.white, fontSize: screenWidth > 600 ? 16.0 : 14.0), // Responsive font size
            ),
          ),
        ),
      ],
    );
  }
}
