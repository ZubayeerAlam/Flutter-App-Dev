import 'package:flutter/material.dart';

class Habitcard extends StatelessWidget {
  //just a habit card widget to display the habit details in a nice way
  final Widget icon;
  final String title;
  final String subtitle;
  final String streak;
  const Habitcard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.streak,
  });
  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isdark ? Colors.grey.shade800 : Colors.white;
    final textColor = isdark ? Colors.white : Colors.black;
    return SizedBox(
      height: 78,
      width: double.infinity,
      child: Card(
        elevation: 1,
        shadowColor: Colors.grey.shade900.withValues(alpha: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: cardColor,
        margin: .zero,

        //pervious code has Container
        // Container (
        // padding: EdgeInsets.all(16),
        // alignment: .center,
        // decoration: BoxDecoration(
        //   color: cardColor,
        //   borderRadius: BorderRadius.circular(12),
        // ),
        // ................)
        child: Padding(
          // card hasnot padding so we use padding widget
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    //logo
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: cardColor,
                        shape: BoxShape.circle,
                      ),
                      child: icon,
                    ),

                    //Gap
                    SizedBox(width: 16),
                    //title and subtitle
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(color: textColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 12,
                                // color: Colors.grey.shade700,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Streaks
              Container(
                child: Column(
                  children: [
                    Text("🔥"),
                    SizedBox(height: 4),
                    Text(
                      streak,
                      style: TextStyle(
                        fontSize: 12,
                        // color: Colors.grey.shade700
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
