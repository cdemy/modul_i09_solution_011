import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    super.key,
    required this.event,
  });

  final Map<String, dynamic> event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(
                child: Text(
                  '${event['year']}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Flexible(
            flex: 6,
            child: Text(
              '${event['text']}',
            ),
          ),
        ],
      ),
    );
  }
}
