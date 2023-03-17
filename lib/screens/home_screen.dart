import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/models/weather_day.dart';

import '../providers/days_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final daysProvider = Provider.of<DaysProvider>(context);

    return Scaffold(
        body: FutureBuilder(
      future: daysProvider.getDays(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    Text(),
                    Text(data),
                    Text(data),
                    Text(data),
                  ],
                ),
              );
            },
          );
        } else {
          print(snapshot.error);
          return Text("no");
        }
      },
    ));
  }
}
