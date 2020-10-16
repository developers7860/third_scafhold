import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:third_scafhold/Article.dart';
import 'package:third_scafhold/Animation/FadeAnimation.dart';

import 'dashboard.dart';
import 'login.dart';

void main() {
  runApp(MyApp1());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "floating button",
      home: LoginHome(),
    );
  }
}

// counter
class FloatingCounterWidget extends StatefulWidget {
  @override
  FloatingCounterWidgetState createState() {
    return FloatingCounterWidgetState();
  }
}

class FloatingCounterWidgetState extends State<FloatingCounterWidget> {
  String _text = 'one';
  int _counter = 0;
  changeText() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('umair'),
      ),
      body: Center(
        child: Text('$_counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeText();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// display image
class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('display image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset('images/logo.jpg'),
          ),
          Text('logo'),
        ],
      ),
    );
  }
}

// listview
class MyListVuew extends StatelessWidget {
  final myList = List<Article>.generate(20,
      (index) => Article('Article no $index', 'details of Article no $index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list view'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.arrow_back_ios),
        //   )
        // ],
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(myList[index].name),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailArticle(myList[index])));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: myList.length),
    );
  }
}

class DetailArticle extends StatelessWidget {
  Article selectedArticle;
  DetailArticle(this.selectedArticle);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Details of Article'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              child: Text(selectedArticle.name),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(selectedArticle.details),
            ),
          ],
        ),
      ),
    );
  }
}

// one activity to second (route)
class RouteOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route One'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('one'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RouteTwo();
            }));
          },
        ),
      ),
    );
  }
}

class RouteTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Two'),
      ),
      body: Center(child: Text('route 2')),
    );
  }
}

// login design
class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400]
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: Stack(
                  children: <Widget>[
                    new Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(100, 95, 27, 3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200])),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Email or Phone numver',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Forget Password ?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange[900],
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Container with social media',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          color: Colors.blue),
                                      child: Center(
                                        child: Text(
                                          'Facebook',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          color: Colors.black),
                                      child: Center(
                                        child: Text(
                                          'Github',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          color: Colors.orange),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return SignUphome();
                                            }));
                                          },
                                          child: Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))),
              ],
            ),
          ),
        ));
  }
}

class SignUphome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.orange[900],
            Colors.orange[800],
            Colors.orange[400]
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please write information carefully',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      new Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60))),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(150, 95, 27, 3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10)),
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'First Name',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Last Name',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Email or Phone Number',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Country',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Province',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'City',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      // decoration: BoxDecoration(
                                      //     border: Border(
                                      //         bottom: BorderSide(
                                      //             color: Colors.grey[200]))),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Area',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginHome();
                                  }));
                                },
                                child: Text(
                                  'Already have an account ?',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.orange[900]),
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              // Container(
                              //   width: double.infinity,
                              //   child: new DropdownButton<String>(
                              //     items: <String>['A', 'B', 'C', 'D']
                              //         .map((String value) {
                              //       return new DropdownMenuItem<String>(
                              //         value: value,
                              //         child: new Text(value),
                              //       );
                              //     }).toList(),
                              //     onChanged: (_) {},
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// login and sign up with firebase by edmtdev
class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    checkUserAlreadyLogin().then((isLogin) {
      if (isLogin == true) {
        print("Already Login");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashBoardScrenn()),
            (route) => false);
      } else {
        print("Not Login");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }
    });

    return new Scaffold(
      body: Card(
        child: Center(
          child: Text(
            'Loading...',
            style: TextStyle(
                color: Colors.indigo,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

checkUserAlreadyLogin() async {
  // check current user is login or not

  FirebaseAuth _auth = FirebaseAuth.instance;
  return _auth
      .currentUser()
      .then((value) => value != null ? true : false)
      .catchError((onError) => false);
}
