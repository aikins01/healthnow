import 'package:flutter/material.dart';
import 'package:healthnowapp/src/screens/choice.dart';
// import 'package:jidi/src/models/cart.dart';
// import 'package:healthnowapp/src/screens/login.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:hisense_care/src/screens/verifypin.dart';

void main() => 
runApp( MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Choice(),
        },
      ),
    );
