import 'package:coffee_app/assets/constants/color_scheme.dart';
import 'package:flutter/material.dart';

import 'assets/elements/profile/profile.dart';
import 'assets/elements/documents/documents.dart';
import 'assets/elements/payment_methods/payment_methods.dart';
import 'assets/elements/bonuses/bonuses.dart';
import 'assets/elements/subscribes/subscribes.dart';
import 'package:coffee_app/assets/constants/adaptive_size.dart';


import 'auth_screen.dart';
import 'yandex_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Auth Screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Nunito'
      ),
      home: const AuthScreen(),
      routes: {
        '/profile': (ctx) => Scaffold(
          body: ProfilePage(),
        ),

        '/payment': (ctx) => Scaffold(
          body: PaymentMethodsPage(),
        ),

        '/subscribe': (ctx) => Scaffold(
          body: SubscribePage(),
        ),

        '/bonuses': (ctx) => Scaffold(
          body: BonusesPage(),
        ),

        '/documents': (ctx) => Scaffold(
          body: DocumentsPage(),
        ),

        '/home': (ctx) => Builder(
          builder: (BuildContext scaffoldContext) => Scaffold(
            // appBar: AppBar(title: const Text('Yandex Maps Example')),
            body: YandexMapWidget(),
            // body: ProfilePage(),
            // body: DocumentsPage(),
            // body: PaymentMethodsPage(),
            // body: BonusesPage(),
            // body: SubscibePage(),


            drawer: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(adaptiveSize(context, 25.0)),
                bottomRight: Radius.circular(adaptiveSize(context, 25.0)),
              ),
              child: Drawer(
                width: MediaQuery.of(scaffoldContext).size.width * 0.75,
                child: ListView(
                  padding: EdgeInsets.all(adaptiveSize(context, 20.0)),
                  children: <Widget>[
                    SizedBox(height: adaptiveSize(context, 30.0)),

                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '+7 987 654 32 10',
                        style: TextStyle(
                          fontSize: adaptiveSize(context, 20.0),
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),

                    SizedBox(height: adaptiveSize(context, 30.0)),

                    InkWell(
                      onTap: () {
                        Navigator.of(scaffoldContext).pushNamed('/profile');
                      },
                      child: Container(
                          padding: EdgeInsets.all(adaptiveSize(context, 10.0)),
                          decoration: BoxDecoration(
                            color: AppColor.figmaColorLight,
                            borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0))
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'lib/assets/images/profile.png',
                              width: adaptiveSize(context, 30.0),
                              height: adaptiveSize(context, 30.0),
                            ),

                            SizedBox(width: adaptiveSize(context, 10.0)),

                            Text(
                              'Профиль',
                              style: TextStyle(
                                fontSize: adaptiveSize(context, 17.0),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: adaptiveSize(context, 20.0)),

                    InkWell(
                      onTap: () {
                        Navigator.of(scaffoldContext).pushNamed('/payment');
                      },
                      child: Container(
                        padding: EdgeInsets.all(adaptiveSize(context, 10.0)),
                        decoration: BoxDecoration(
                            color: AppColor.figmaColorLight,
                            borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0))
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'lib/assets/images/payment.png',
                              width: adaptiveSize(context, 30.0),
                              height: adaptiveSize(context, 30.0),
                            ),

                            SizedBox(width: adaptiveSize(context, 10.0)),

                            Text(
                              'Способы оплаты',
                              style: TextStyle(
                                fontSize: adaptiveSize(context, 17.0),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: adaptiveSize(context, 20.0)),

                    InkWell(
                      onTap: () {
                        Navigator.of(scaffoldContext).pushNamed('/subscribe');
                      },
                      child: Container(
                        padding: EdgeInsets.all(adaptiveSize(context, 10.0)),
                        decoration: BoxDecoration(
                            color: AppColor.figmaColorLight,
                            borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0))
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'lib/assets/images/subscribe.png',
                              width: adaptiveSize(context, 30.0),
                              height: adaptiveSize(context, 30.0),
                            ),

                            SizedBox(width: adaptiveSize(context, 10.0)),

                            Text(
                              'Подписка',
                              style: TextStyle(
                                fontSize: adaptiveSize(context, 17.0),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: adaptiveSize(context, 20.0)),

                    InkWell(
                      onTap: () {
                        Navigator.of(scaffoldContext).pushNamed('/bonuses');
                      },
                      child: Container(
                        padding: EdgeInsets.all(adaptiveSize(context, 10.0)),
                        decoration: BoxDecoration(
                            color: AppColor.figmaColorLight,
                            borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0))
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'lib/assets/images/star.png',
                              width: adaptiveSize(context, 30.0),
                              height: adaptiveSize(context, 30.0),
                            ),

                            SizedBox(width: adaptiveSize(context, 10.0)),

                            Text(
                              'Бонусы',
                              style: TextStyle(
                                fontSize: adaptiveSize(context, 17.0),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: adaptiveSize(context, 20.0)),

                    InkWell(
                      onTap: () {
                        Navigator.of(scaffoldContext).pushNamed('/documents');
                      },
                      child: Container(
                        padding: EdgeInsets.all(adaptiveSize(context, 10.0)),
                        decoration: BoxDecoration(
                            color: AppColor.figmaColorLight,
                            borderRadius: BorderRadius.circular(adaptiveSize(context, 10.0))
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'lib/assets/images/documents.png',
                              width: adaptiveSize(context, 30.0),
                              height: adaptiveSize(context, 30.0),
                            ),

                            SizedBox(width: adaptiveSize(context, 10.0)),

                            Text(
                              'Документы',
                              style: TextStyle(
                                fontSize: adaptiveSize(context, 17.0),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      },
    );
  }
  // ---
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter += 1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
