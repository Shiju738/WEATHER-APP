import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/controller/controller.dart';
import 'package:weather_project/view/search_page.dart';
import 'package:weather_project/widget/fort_cast.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, _) {
        String formattedDate = DateFormat.yMMMd().format(
          DateTime.now(),
        );

        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            backgroundColor: Colors.grey,
            leading: const Icon(Icons.location_on),
            title: Text(weatherProvider.cityInfo?.name ?? ''),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today $formattedDate', // Display today's date
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${weatherProvider.WeatherData?.main?.temp} °C',
                                  style: const TextStyle(fontSize: 30),
                                ),
                                Text(
                                  ' ${weatherProvider.WeatherData?.main?.tempMax.toString()}°C,  ${weatherProvider.WeatherData?.main?.tempMin.toString()}°C',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.refresh))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Feel like'),
                                    Row(
                                      children: [
                                        const Icon(Icons.ac_unit),
                                        Text(
                                            '${weatherProvider.WeatherData?.main?.feelsLike} °C'),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Feel like'),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40),
                                      child: Row(
                                        children: [
                                          // Replace Icons.ac_unit with the desired icon
                                          Text(
                                              "${weatherProvider.WeatherData?.weather?[0].description}"),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Wind Speed'),
                                Row(
                                  children: [
                                    const Icon(Icons.wind_power_outlined),
                                    Text(
                                        '${weatherProvider.WeatherData?.wind?.speed}')
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Humidity'),
                                Row(
                                  children: [
                                    const Icon(Icons.water_drop_outlined),
                                    Text(
                                        '${weatherProvider.WeatherData?.main?.humidity} %')
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('5 day Brought_cast')
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.sunny),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Tommorow'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Sunny'),
                                Spacer(),
                                Text('24 °C/27 °C')
                              ],
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.sunny),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Wednesday'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Sunny'),
                                Spacer(),
                                Text('24 °C/27 °C')
                              ],
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.sunny),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Thursday'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Sunny'),
                                Spacer(),
                                Text('24 °C/27 °C')
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    ),
                    WeatherForecastWidget()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
