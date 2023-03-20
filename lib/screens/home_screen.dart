import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/providers/today_provider.dart';

import '../providers/days_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final daysProvider = Provider.of<DaysProvider>(context);
    final todayProvider = Provider.of<TodayProvider>(context);
    final lista = daysProvider.listaDias;
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            Container(
              height: 400,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${todayProvider.temp.round()}°",
                    style: TextStyle(fontSize: 100),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "${todayProvider.country_city}",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    // color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade500),
                          width: 100,
                          // color: Colors.grey.shade500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Min."),
                              Text("${todayProvider.temp_min.round()}°")
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade500),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Max."),
                              Text("${todayProvider.temp_max.round()}°")
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade500),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Humedad"),
                              Text("${todayProvider.humidity} %")
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade500),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Viento"),
                              Text("${todayProvider.wind} Km/h")
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            ),
            Expanded(
              child: lista.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (BuildContext context, int index) {
                        final fecha =
                            lista[index].fecha.split(" ")[0].split("-");

                        final hora =
                            lista[index].fecha.split(" ")[1].split(":")[0];

                        return Container(
                          height: 60,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Text('${fecha[2]}-${fecha[1]} '),
                                ),
                                Container(
                                  child: Text('$hora:00hs'),
                                  width: 50,
                                ),
                                Container(
                                  child: Text('${lista[index].temp_min}° min'),
                                  width: 50,
                                ),
                                Container(
                                  child: Text('${lista[index].temp_max}° max'),
                                  width: 50,
                                ),
                                Container(
                                  child: Text(lista[index].description),
                                  width: 50,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
