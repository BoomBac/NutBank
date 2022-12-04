import 'package:flutter/cupertino.dart';

import 'package:nut_bank/view/BankingDashboard.dart';
import 'package:nut_bank/view/BankingForgotPwd.dart';
import './view/BankingSignIn.dart';


Map<String,WidgetBuilder> routers = 
{
  "/":(context) => BankingDashboard(),
  BankingSignIn.tag :(context) => BankingSignIn(),
  BankingDashboard.tag:(context) => BankingDashboard(),
  BankingForgotPwd.tag:(context) => BankingForgotPwd()
};
