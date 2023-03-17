import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/models/weather_day.dart';

import '../providers/days_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final daysProvider = Provider.of<DaysProvider>(context);
    final lista = daysProvider.listaDias;
    return Scaffold(
      body: lista.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: lista.length,
              itemBuilder: (BuildContext context, int index) {
                final fecha = lista[index].fecha.split(" ")[0];
                final hora = lista[index].fecha.split(" ")[1];

                return Card(
                  child: Column(
                    children: [
                      Text(fecha),
                      Text(hora),
                      Text(lista[index].temp_min),
                      Text(lista[index].temp_max),
                      Text(lista[index].description),
                    ],
                  ),
                );
              },
            ),
      // body: FutureBuilder(
      //   future: DaysProvider().getDays(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       List<WeatherDay>? lista = snapshot.data;
      //       return ListView.builder(
      //         itemCount: lista?.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return Card(
      //             child: Column(
      //               children: [
      //                 Text(lista![index].fecha),
      //                 Text('${lista[index].temp_min}'),
      //                 Text('${lista[index].temp_max}'),
      //                 Text(lista[index].description),
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     } else if (snapshot.hasError) {
      //       print(snapshot.error);
      //       return Text("no");
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }
}
