import 'dart:convert';
import 'package:json_pairing/Home1.dart';
import 'package:json_pairing/model/jsonformatmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_pairing/splash.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    routes: {
      '/': (context) => Splash(),
      'Home': (context) => Home(),
      'Homee': (context) => Homee()
    },
  ));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1,
              child: Image.network(
                  'https://w0.peakpx.com/wallpaper/532/1/HD-wallpaper-shree-krishna-bhagavad-gita-lord-shiva-mahabharata-ramayan.jpg',
                  fit: BoxFit.cover),
            ),
            FutureBuilder(
              future: rootBundle.loadString("lib/json.json"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  String JsonData = snapshot.data;
                  List myData = jsonDecode(JsonData);
                  List data =
                      myData.map((e) => jsonmodel.fromjson(Data: e)).toList();
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          jsonmodel js = jsonmodel(
                              id: data[index].id,
                              bhagvatgitaslok: data[index].bhagvatgitaslok,
                              english: data[index].english,
                              hindi: data[index].hindi,
                              gujrati: data[index].gujrati,
                              adhyay: data[index].adhyay);
                          Navigator.pushNamed(context, 'Homee', arguments: js);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10, right: 10),
                          child: Card(
                            color: Colors.white,
                            child: ListTile(
                              title: AnimatedTextKit(
                                  isRepeatingAnimation: true,
                                  repeatForever: true,
                                  animatedTexts: [
                                    FadeAnimatedText(data[index].adhyay),
                                  ]),
                              subtitle: Text(data[index].bhagvatgitaslok),
                              trailing: DefaultTextStyle(
                                style: TextStyle(color: Colors.black),
                                child: AnimatedTextKit(
                                  isRepeatingAnimation: true,
                                  repeatForever: true,
                                  animatedTexts: [
                                    FadeAnimatedText(
                                      data[index].id.toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container(
                  height: MediaQuery.of(context).size.height / 1,
                  child: Image.network(
                      'https://w0.peakpx.com/wallpaper/532/1/HD-wallpaper-shree-krishna-bhagavad-gita-lord-shiva-mahabharata-ramayan.jpg',
                      fit: BoxFit.cover),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
