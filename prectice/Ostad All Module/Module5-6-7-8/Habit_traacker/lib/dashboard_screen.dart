import 'package:flutter/material.dart';

import 'add_habit_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  // final String title;

  @override
  Widget build(BuildContext context) {
    final List<Widget> habitCards = [
      Habitcard(
        icon: Icon(Icons.local_drink),
        title: "Drinking water",
        subtitle: "1/3 glasses",
        streak: "3 days",
      ),
      // SizedBox(height: 16,),
      Habitcard(
        icon: Icon(Icons.self_improvement),
        title: "Maditating",
        subtitle: "10 minutes",
        streak: "5 days",
      ),
      // SizedBox(height: 16,),
      Habitcard(
        icon: Icon(Icons.fitness_center),
        title: "Exercising",
        subtitle: "30 minutes",
        streak: "2 days",
      ),

      // SizedBox(height: 16,),
      Habitcard(
        icon: Icon(Icons.book),
        title: "Reading",
        subtitle: "20 pages",
        streak: "4 days",
      ),
      // SizedBox(height: 16,),
      Habitcard(
        icon: Icon(Icons.bedtime),
        title: "Sleeping",
        subtitle: "8 hours",
        streak: "6 days",
      ),
    ];

    return Scaffold(
      //System gray background color code
      // backgroundColor: Color.fromRGBO(199, 199, 204, 1),
      // backgroundColor: Color(0xFFD3D3D3),  //done
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // centerTitle: false,
        title: Text("Habit Tracker"),
        // elevation: 1,
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: (
      //
      //       ) {
      //     // Navigate to the AddHabitScreen
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => AddHabitScreen()),
      //     );
      //   },
      //   child: Icon(Icons.add),
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              OrientationBuilder(
                builder: (context, orientation) {
                  // print(orientation.name); //always returns portrait

                  final isPortrait =
                      MediaQuery.orientationOf(context) == Orientation.portrait;
                  if (isPortrait) {
                    return Column(
                      spacing: 16,
                      children:
                          //Habit cards
                          habitCards,
                    );
                  } else {
                    return Column(
                      spacing: 16,
                      children: [
                        for (var i = 0; i < habitCards.length; i += 2)
                          Row(
                            spacing: 16,
                            children: [
                              Expanded(child: habitCards[i]),
                              // SizedBox(width: 16,),
                              if (i + 1 < habitCards.length)
                                Expanded(child: habitCards[i + 1]),
                            ],
                          ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 16),

              FilledButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddHabitScreen()),
                  );
              },style:FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    minimumSize: Size(double.infinity, 48)
                    ),child: Text("View All Habits"))
            ],
          ),
        ),
      ),
    );
  }
}

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
    final isdark=Theme.of(context).brightness==Brightness.dark;
    final cardColor=isdark?Colors.grey.shade800:Colors.white;
    final textColor=isdark?Colors.white:Colors.black;
    return Container(
      padding: EdgeInsets.all(16),
      alignment: .center,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Row(
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
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: TextStyle(color: textColor),),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        // color: Colors.grey.shade700,
                        color: textColor
                      ),

                    ),
                  ],
                ),
              ),
            ],
          ),

          //Streaks
          Container(
            child: Column(
              children: [
                Text("🔥"),
                SizedBox(height: 4),
                Text(
                  streak,
                  style: TextStyle(fontSize: 12,
                      // color: Colors.grey.shade700
                  color: textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
