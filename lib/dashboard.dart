import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pie Chart Dashboard',
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(255, 84, 98, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Display Card with Pie Chart and Text
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Revenue Distribution',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Wrap PieChart in a SizedBox with a fixed height
                      SizedBox(
                        height: 200,
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                value: 60,
                                color: Color.fromARGB(255, 243, 33, 68),
                                title: 'Hacked',
                                radius: 50,
                              ),
                              PieChartSectionData(
                                value: 5,
                                color: Colors.green,
                                title: 'Not Hacked',
                                radius: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Display Card with Most Important Features
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Most Important Features:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // List of information
                      _buildFeatureListItem('IP_Risk_Score / IP_Risk_Level'),
                      _buildFeatureListItem('Response_Effectiveness'),
                      _buildFeatureListItem('Source_Port_Risk / Destination_Port_Risk'),
                      _buildFeatureListItem('Event_Risk_Score'),
                      _buildFeatureListItem('Network_Layer_Score'),
                      _buildFeatureListItem('Signature_Frequency / Signature_Variety'),
                      _buildFeatureListItem('Protocol_Risk'),
                      _buildFeatureListItem('Severity_Score / Anomaly_Index'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureListItem(String subTitle) {
    return Container(
      height: 60, // Set the desired height
      child: ListTile(
        subtitle: Text(subTitle),
      ),
    );
  }
}
