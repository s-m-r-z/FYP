import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey =
      'pk_test_51Kmj2LLo1dycx6bEpKh2Dw8c47mvRvIiaOSqHUsMqOocNFun7ohI4tgQ1GnmIax8KiwdDd6ncPpvgeKaRzntPxNY00GqpRRM1e';

  await Stripe.instance.applySettings();

  runApp(const mainscreen());
}
