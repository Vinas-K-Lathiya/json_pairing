import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'model/jsonformatmodel.dart';

bool a = false;
bool b = false;
bool c = false;
bool d = true;
bool f = false;

class Homee extends StatefulWidget {
  Homee({Key? key}) : super(key: key);

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  @override
  Widget build(BuildContext context) {
    jsonmodel jss = ModalRoute.of(context)!.settings.arguments as jsonmodel;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://w0.peakpx.com/wallpaper/532/1/HD-wallpaper-shree-krishna-bhagavad-gita-lord-shiva-mahabharata-ramayan.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 200,
              ),
              (a == true)
                  ? DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText('${jss.english}'),
                        ],
                        isRepeatingAnimation: true,
                      ),
                    )
                  : Text(''),
              (b == true)
                  ? DefaultTextStyle(
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText(
                            "${jss.gujrati}",
                          ),
                        ],
                      ),
                    )
                  : Text(''),
              (c == true)
                  ? DefaultTextStyle(
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText(
                            "${jss.hindi}",
                          ),
                        ],
                      ),
                    )
                  : Text(''),
              (d == true)
                  ? Container(
                    child: DefaultTextStyle(
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText(
                              "${jss.bhagvatgitaslok}",
                            ),
                          ],
                        ),
                      ),
                  )
                  : Text(''),
              SizedBox(
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            a = !a;
                          });
                        },
                        child: Text("English")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            b = !b;
                          });
                        },
                        child: Text("Gujrati")),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          c = !c;
                        });
                      },
                      child: Text("Hindi")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          d = !d;
                        });
                      },
                      child: Text("Sanskrit")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
