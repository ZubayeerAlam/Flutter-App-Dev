import 'package:flutter/material.dart';
//new setup done

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Habit Tracker'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //System gray background color code
      // backgroundColor: Color.fromRGBO(199, 199, 204, 1),

      backgroundColor: Color(0xFFD3D3D3),
      appBar: AppBar(

        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: false,
        title: Text(title),
        elevation: 1,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      shape: CircleBorder(),
        child: Icon(Icons.add),
      ),

      body:
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Habitcard(
              icon: Icon(Icons.local_drink),
              title: "Drinking water",
              subtitle: "1/3 glasses",
              streak: "3 days",
            ),
            SizedBox(height: 16,),
            Habitcard(
              icon: Icon(Icons.self_improvement),
              title: "Maditating",
              subtitle: "10 minutes",
              streak: "5 days",

            ),
            SizedBox(height: 16,),
            Habitcard(
              icon: Icon(Icons.fitness_center),
              title: "Exercising",
              subtitle: "30 minutes",
              streak: "2 days",
            ),

            SizedBox(height: 16,),
            Habitcard(
              icon: Icon(Icons.book),
              title: "Reading",
              subtitle: "20 pages",
              streak: "4 days",
            ),
             SizedBox(height: 16,),
            Habitcard(
              icon: Icon(Icons.bedtime),
              title: "Sleeping",
              subtitle: "8 hours",
              streak: "6 days",
            ),

          ],
        ),
      ),
    );
  }
}


class Habitcard extends StatelessWidget{

//just a habit card widget to display the habit details in a nice way
  final Widget icon;
  final String title;
  final String subtitle;
  final String streak;
  const Habitcard(
      {
        super.key,
        required this.icon,
        required this.title ,
        required this.subtitle,
        required this.streak
      });
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(16),
            alignment: .center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
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
                          color: Color(0xFFF55F5),
                          shape: BoxShape.circle
                      ),
                        child: icon
                    ),

                    //Gap
                    SizedBox(width: 16,),
                    //title and subtitle
                    Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title),
                            SizedBox(height: 4,),
                            Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                          ],
                        )
                    ),

                  ],
                ),


                //Streaks
                Container(
                  child:
                  Column(
                    children: [
                      Text("🔥"),
                      SizedBox(height: 4,),
                      Text(streak, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                    ],
                  ),
                )

              ],
            ),

    );
  }
}