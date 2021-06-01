import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart';
import 'package:manual_serialization/models/company_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Manual Serialization'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _sampleResponse = {
    "company_name": "NepNinja",
    "company_contact": {
      "phone": "9999999999",
      "email": "nepninja@gmail.com",
      "address": "Kathmandu"
    },
    "employees": [
      {
        "id": 100,
        "name": "Bindu",
        "address": "Kathmandu",
        "designation": "Software Engineer"
      },
      {
        "id": 101,
        "name": "John",
        "address": "Georgia Atlanta",
        "designation": "Software Engineer"
      }
    ]
  };

  // this function mocks api call
  Future<CompanyInfo> _fetchCompanyInfo() async {
    await Future.delayed(Duration(seconds: 3));
    Response response = Response(jsonEncode(_sampleResponse), 200);
    return companyInfoFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<CompanyInfo>(
        future: _fetchCompanyInfo(),
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.all(10),
            child: snapshot.hasData
                ? Column(
                    children: [
                      // company detail
                      Card(
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.companyName!,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(snapshot.data!.companyContact!.address!),
                                Text(snapshot.data!.companyContact!.phone!),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // employee list
                      Expanded(
                          child: Card(
                        child: ListView(
                          children: snapshot.data!.employees!
                              .map(
                                (e) => ListTile(
                                  leading: CircleAvatar(),
                                  title: Text(e.name!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(e.designation!),
                                ),
                              )
                              .toList(),
                        ),
                      )),
                    ],
                  )
                : snapshot.hasError
                    ? Center(child: Text("Something went wrong"))
                    : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
