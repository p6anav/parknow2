import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class SvgUpdater extends StatefulWidget {
  @override
  _SvgUpdaterState createState() => _SvgUpdaterState();
}

class _SvgUpdaterState extends State<SvgUpdater> {
  List<Map<String, dynamic>> mockSlots = [];
  Map<String, double> slotProgress = {};
  Map<String, Duration> slotTimers = {}; // To store remaining time for each slot
  String? selectedSlotId;
  Timer? progressTimer;

  @override
  void initState() {
    super.initState();
    loadJson();
    startProgressUpdates();
  }

  @override
  void dispose() {
    progressTimer?.cancel(); // Cancel timer to avoid memory leaks
    super.dispose();
  }

  /// Loads mock slots data from JSON
  Future<void> loadJson() async {
    try {
      String jsonString = await rootBundle.loadString('lib/assets/parking.json');
      List<dynamic> jsonResponse = jsonDecode(jsonString);

      setState(() {
        mockSlots = jsonResponse.map((slot) => slot as Map<String, dynamic>).toList();

        // Initialize progress and timers based on remainingTime
        for (var slot in mockSlots) {
          String slotId = slot['id'] ?? 'unknown';
          String? remainingTimeStr = slot['remainingTime'];
          Duration remainingTime = remainingTimeStr != null
              ? parseDuration(remainingTimeStr)
              : Duration.zero; // Default to zero if no time is available

          slotProgress[slotId] = 1.0; // Start with full progress
          slotTimers[slotId] = remainingTime; // Store remaining time
        }
      });
    } catch (e) {
      debugPrint('Error loading JSON: $e');
    }
  }

  // Fixing parseDuration and formatRemainingTime
  Duration parseDuration(String timeStr) {
    List<String> parts = timeStr.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    int seconds = int.parse(parts[2]);
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  String formatRemainingTime(Duration duration) {
    if (duration == Duration.zero) return '';
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  // Fixing progress updates
  void startProgressUpdates() {
  progressTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    setState(() {
      bool allZero = true;

      slotTimers.forEach((slotId, remainingTime) {
        if (remainingTime > Duration.zero) {
          allZero = false;

          // Decrease time by 1 second
          slotTimers[slotId] = remainingTime - const Duration(seconds: 1);

          // Find the initial duration based on the slot ID and use it to calculate the progress
          Duration initialTime = parseDuration(
            mockSlots.firstWhere((slot) => slot['id'] == slotId)['remainingTime']
          );

          // Safely calculate the progress for the slot
          slotProgress[slotId] = slotTimers[slotId]!.inSeconds / initialTime.inSeconds;
        } else {
          // No remaining time, set progress to 0
          slotProgress[slotId] = 0;
        }
      });

      if (allZero) {
        timer.cancel(); // Stop the timer if all slots are finished
      }
    });
  });
}

  /// Selects or deselects a parking slot
  void selectSlot(String slotId) {
    setState(() {
      selectedSlotId = (selectedSlotId == slotId) ? null : slotId;
    });
  }

  /// Displays slot details in a popup
  void showSlotDetails(Map<String, dynamic> slot) {
    showDialog(
      context: context,
      builder: (context) {
        String slotId = slot['id'] ?? 'Unknown';
        String position = '(${slot['x'] ?? 0}, ${slot['y'] ?? 0})';
        String size = '${slot['width'] ?? 0} x ${slot['height'] ?? 0}';
        String color = slot['fill'] ?? 'Unknown';
        String type = slot['type'] ?? 'Unknown';
        Duration remainingTime = slotTimers[slotId] ?? Duration.zero;
        String formattedTime = formatRemainingTime(remainingTime); // Format the time

        return AlertDialog(
          title: Text('Slot Details: $slotId'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Position: $position'),
              Text('Size: $size'),
              Text('Color: $color'),
              Text('Type: $type'),
              Text('Remaining Time: $formattedTime'), // Use formatted time
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  /// Returns the appropriate icon for the slot type
  Widget getSlotIcon(String? type) {
    switch (type) {
      case 'car':
        return Icon(Icons.directions_car, size: 20, color: Colors.white);
      case 'bike':
        return Icon(Icons.directions_bike, size: 20, color: Colors.white);
      default:
        return SizedBox(height: 20,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6E6),
      body: Center(
        child: mockSlots.isEmpty
            ? const CircularProgressIndicator(color: Colors.blue)
            : InteractiveViewer(
                panEnabled: true,
                scaleEnabled: true,
                minScale: 0.5,
                maxScale: 4.0,
                child: Stack(
                  children: mockSlots.map((slot) {
                    String slotId = slot['id'] ?? 'unknown';
                    bool isSelected = selectedSlotId == slotId;

                    return SlotWidget(
                      slot: slot,
                      progress: slotProgress[slotId] ?? 1.0,
                      isSelected: isSelected,
                      onSelect: () {
                        selectSlot(slotId);
                        showSlotDetails(slot);
                      },
                      getIcon: getSlotIcon,
                      timerText: formatRemainingTime(slotTimers[slotId] ?? Duration.zero),
                    );
                  }).toList(),
                ),
              ),
      ),
    );
  }
}

/// Custom widget to represent a parking slot
class SlotWidget extends StatelessWidget {
  final Map<String, dynamic> slot;
  final double progress;
  final bool isSelected;
  final VoidCallback onSelect;
  final Widget Function(String?) getIcon;
  final String timerText;

  const SlotWidget({
    Key? key,
    required this.slot,
    required this.progress,
    required this.isSelected,
    required this.onSelect,
    required this.getIcon,
    required this.timerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color fillColor = _parseColor(slot['fill'] ?? '#ECECEC', isSelected);

    return Positioned(
      left: (slot['x'] ?? 0).toDouble(),
      top: (slot['y'] ?? 0).toDouble(),
      child: GestureDetector(
        onTap: onSelect,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Only show the progress bar if there's remaining time
            if (progress > 0)
              Container(
                width: (slot['width'] ?? 40).toDouble(),
                height: 6,
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: FractionallySizedBox(
                  widthFactor: progress,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: progress > 0.3 ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            // Slot container
            Container(
              width: (slot['width'] ?? 40).toDouble(),
              height: (slot['height'] ?? 40).toDouble(),
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getIcon(slot['type']),
                  SizedBox(height: 2), // Space between icon and timer
                  // Timer text or "No Time Remaining" if progress is 0
                  Text(
                    progress > 0 ? timerText : '',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 238, 238, 238),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Color _parseColor(String hexColor, bool isSelected) {
    try {
      return isSelected
          ? Colors.blue
          : Color(int.parse('0xFF' + hexColor.substring(1)));
    } catch (e) {
      return Colors.grey;
    }
  }


}
void main() {
  runApp(MaterialApp(home: SvgUpdater()));
}
