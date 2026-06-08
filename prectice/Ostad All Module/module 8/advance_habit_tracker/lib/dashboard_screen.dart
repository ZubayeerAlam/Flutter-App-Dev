import 'package:flutter/material.dart';

import 'add_habit_screen.dart';
import 'habit_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  // final String title;

  @override
  Widget build(BuildContext context) {
    final String coverImagelink =
        "https://thumbs.dreamstime.com/b/top-view-flat-lay-habit-tracker-book-pen-cup-black-coffee-succulent-plant-pot-blue-background-copy-space-206715044.jpg";
    bool isloading = false;
    final isPortrait =
        MediaQuery.orientationOf(context) == Orientation.portrait;
    final List<Widget> habitCards = [
      Habitcard(
        icon: Icon(Icons.local_drink),
        title: "Please, Drinking water all day at least 4 litter, good luck",
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the AddHabitScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHabitScreen()),
          );
        },
        child: Icon(Icons.add),
      ),

      body: SafeArea(
        child: Container(
          //for background
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assetsl/Cover-photo.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),

          // child: SingleChildScrollView(
          //
          //   child: Column(
          //     spacing: 16,
          //     children: [
          //       SizedBox(
          //         width: double.infinity,
          //         height: 200,
          //         // child: Image.network(coverImagelink, fit: BoxFit.cover),
          //         child: Image.asset(
          //           "assetsl/Cover-photo.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //
          //       // OrientationBuilder(
          //       //   builder: (context, orientation) {
          //       // print(orientation.name); //always returns portrait
          //
          //       // final isPortrait = MediaQuery.orientationOf(context) == Orientation.portrait;
          //
          //       // if (isPortrait) {
          //       //   return Column(
          //       //     spacing: 16,
          //       //     children:
          //       //         //Habit cards
          //       //         habitCards,
          //       //   );
          //       // } else {
          //       //   return Column(
          //       //     spacing: 16,
          //       //     children: [
          //       //       for (var i = 0; i < habitCards.length; i += 2)
          //       //         Row(
          //       //           spacing: 16,
          //       //           children: [
          //       //             Expanded(child: habitCards[i]),
          //       //             // SizedBox(width: 16,),
          //       //             if (i + 1 < habitCards.length)
          //       //               Expanded(child: habitCards[i + 1]),
          //       //           ],
          //       //         ),
          //       //     ],
          //       //   );
          //       // }
          //       // },
          //       // ),
          //
          //       //another way to do it
          //       Padding(
          //         padding: const EdgeInsets.all(16),
          //         child: Column(
          //           spacing: 16,
          //           children: [
          //
          //             if (isPortrait)
          //               ...habitCards
          //             else
          //               Column(
          //                 spacing: 16,
          //                 children: [
          //                   for (var i = 0; i < habitCards.length; i += 2)
          //                     Row(
          //                       spacing: 16,
          //                       children: [
          //                         Expanded(child: habitCards[i]),
          //                         // SizedBox(width: 16,),
          //                         if (i + 1 < habitCards.length)
          //                           Expanded(child: habitCards[i + 1]),
          //                       ],
          //                     ),
          //                 ],
          //               ),
          //           ],
          //         ),
          //       ),
          //
          //       const SizedBox(height: 16),
          //
          //       // FilledButton(onPressed: isloading? null:(){
          //       //     Navigator.push(
          //       //       context,
          //       //       MaterialPageRoute(builder: (context) => AddHabitScreen()),
          //       //     );
          //       // },style:FilledButton.styleFrom(
          //       //       backgroundColor: Theme.of(context).colorScheme.primary,
          //       //       foregroundColor: Colors.white,
          //       //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //       //       minimumSize: Size(double.infinity, 42)
          //       //       ),child: isloading?SizedBox(
          //       //         height: 24,
          //       //         width: 24,
          //       //         child: CircularProgressIndicator(
          //       //         color: Colors.white),
          //       //       ): Text("View All Habits")
          //       // ),
          //     ],
          //   ),
          // ),
          child: isPortrait
              ? ProtraitLayout(habitCards: habitCards)
              : LandscapeLayout(habitCards),
          //we can pass Listview.builder directly here
        ),
      ),
    );
  }
}

class ProtraitLayout extends StatelessWidget {
  const ProtraitLayout({super.key, required this.habitCards});
  final List<Widget> habitCards;

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.orientationOf(context) == Orientation.portrait;
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: habitCards.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            children: [
              habitCards[index],

              //we use
              // if (isPortrait) habitCards[index],
              // if (!isPortrait)       //noob approach

              //   Row(               // we use Gridview builder
              //     spacing: 16,
              //     children: [
              //       Expanded(child: habitCards[index * 2]),
              //
              //       if ((index * 2) + 1 < habitCards.length)
              //         Expanded(child: habitCards[(index * 2) + 1]),
              //     ],
              //   ),
            ],
          ),
        );
      },
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout(this.habitCards);
  final List<Widget> habitCards;

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width / 2;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: cardWidth / 100, //width by height
        crossAxisCount: 2,
      ),
      padding: EdgeInsets.all(16),
      itemCount: habitCards.length,
      itemBuilder: (context, index) {
        return habitCards[index];
      },
    );
  }
}

//H.W
//spacer and Divider
