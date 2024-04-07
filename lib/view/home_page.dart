import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/controller/controller.dart';
import 'package:weather_project/view/search_page.dart';

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
    return Consumer<WeatherDataProvider>(
      builder: (context, weatherProvider, _) {
        String formattedDate = DateFormat.yMMMd().format(
          DateTime.now(),
        );

        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.grey,
            leading: const Icon(Icons.location_on),
            title: Text(weatherProvider.cityModel?.name ?? ''),
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
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(150, 66, 72, 67),
                            Colors.white,
                            Color.fromARGB(150, 66, 72, 67),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today $formattedDate',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${weatherProvider.weatherData?.weather?[0].main}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${weatherProvider.weatherData?.main?.temp} °C',
                                  style: const TextStyle(fontSize: 30),
                                ),
                                Text(
                                  ' ${weatherProvider.weatherData?.main?.tempMax.toString()}°C,  ${weatherProvider.weatherData?.main?.tempMin.toString()}°C',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    // Call the method to fetch weather data again
                                    await weatherProvider.fetchWeatherData(
                                        weatherProvider.cityModel?.lat ?? 0.0,
                                        weatherProvider.cityModel?.lon ?? 0.0);

                                    // Call the method to fetch forecast data again
                                    await weatherProvider.fetchWeatherDataList(
                                        weatherProvider.cityModel?.lat ?? 0.0,
                                        weatherProvider.cityModel?.lon ?? 0.0);

                                    // Trigger a rebuild of the UI
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.refresh),
                                )
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
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Feel like',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.ac_unit),
                                        Text(
                                            '${weatherProvider.weatherData?.main?.feelsLike} °C'),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Humidity is making it',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40),
                                      child: Row(
                                        children: [
                                          // Replace Icons.ac_unit with the desired icon
                                          Text(
                                              "${weatherProvider.weatherData?.weather?[0].description}"),
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
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Wind Speed',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.wind_power_outlined),
                                    Text(
                                        '${weatherProvider.weatherData?.wind?.speed}')
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Humidity',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.water_drop_outlined),
                                    Text(
                                        '${weatherProvider.weatherData?.main?.humidity} %')
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
                    // Forecast Data Container
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
                            const Row(
                              children: [
                                Icon(Icons.calendar_month),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '5 day Forecast',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Consumer<WeatherDataProvider>(
                              builder: (context, weatherProvider, _) {
                                final weatherDataList =
                                    weatherProvider.weatherDataList;

                                if (weatherDataList != null &&
                                    weatherDataList.length >= 5) {
                                  // Sort the weather data list by date
                                  weatherDataList.sort(
                                      (a, b) => a.dtTxt.compareTo(b.dtTxt));

                                  return Column(
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        ListTile(
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                // Format the date from the forecast data
                                                DateFormat('EEE, MMM d').format(
                                                    DateTime.now().add(
                                                        Duration(days: i + 1))),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                weatherDataList[i]
                                                    .weather[0]
                                                    .description,
                                                style: const TextStyle(
                                                    fontSize: 13),
                                              ),
                                              Text(
                                                // Display the max and min temperatures
                                                '${weatherDataList[i].main.tempMax.round()}° / ${weatherDataList[i].main.tempMin.round()}°',
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  );
                                } else {
                                  // If forecast list is null or doesn't have enough data, display a message
                                  return const Text(
                                      'Not enough forecast data available');
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    )
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
