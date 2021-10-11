import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoneRegister extends StatefulWidget {
  @override
  _DoneRegisterState createState() => _DoneRegisterState();
}

class _DoneRegisterState extends State<DoneRegister> {
  void delay() {
    Future.delayed(Duration(seconds: 3), () {
      // Navigator.pushNamed(context, '/onboarding');
      // Navigator.pushReplacement(context,new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
      read('user');
    });
  }

  read(k) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$k';
    final value = prefs.getString(key) ?? '0';
    print('read: $value');
    if (value == '0') {
      // user does not have a user
      // Navigator.pushReplacement(
      //     context, new MaterialPageRoute(builder: (context) => new Signup())
      //     );
    } else {
      // get user and pass it
      // Navigator.pushReplacement(
      // context, new MaterialPageRoute(builder: (context) => new Cart(products: [],))
      // );
      // Navigator.pushReplacement(
      //     context, new MaterialPageRoute(builder: (context) => Delivery())
      //     );
    }
    // return value;
    // print('read: $value');
  }

  @override
  void initState() {
    super.initState();
    delay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: new Stack(
          children: ([
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/verified.png',
              ),
              height: 150.0,
              width: 150.0,
            ),
          ),
          Center(
            child:
          Column(  
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            Container(
            child: Text(
                  "Verified",
                  style: new TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]
                    // foreground: Paint()..shader = linearGradient
                  ),
                  textAlign: TextAlign.center,
                ),
          ),
          SizedBox(height: 10,),
              Center(
                child: Text(
                  "All your information has checked out.\nPlease Check your email for our terms and conditions. Thank You",
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]
                    // foreground: Paint()..shader = linearGradient
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 190,
              )
            ],
          ),
          ),
        ]
        )
        )
        )
        );
  }

  Widget myTextComponent(Color color, String text,
      {double size = 30,
      FontWeight weight = FontWeight.w700,
      TextAlign align = TextAlign.center}) {
    return Text(text,
        textAlign: align,
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
        ));
  }
}
