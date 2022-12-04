import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nut_bank/view/BankingForgotPwd.dart';
import 'BankingDashboard.dart';

import '../utils/BankingColors.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';

class BankingSignIn extends StatefulWidget 
{
  static var tag = "/BankingSignIn";

  @override
  _BankingSignInState createState() => _BankingSignInState();
}

class _BankingSignInState extends State<BankingSignIn> 
{
  late TextEditingController _controller_userid;
  late TextEditingController _controller_pwd;
  
  @override
  void initState() 
  {
    super.initState();
    _controller_userid = TextEditingController();
    _controller_pwd = TextEditingController();

    _controller_userid.addListener(() {print(_controller_userid.text);});
    _controller_pwd.addListener(() {print(_controller_pwd.text);});
  }

  @override
  void dispose() {
    _controller_userid.dispose();
    _controller_pwd.dispose();
    // TODO: implement disposeno
    super.dispose();
  }

  void _OnLoginClicked() async
  {
    if(_controller_userid.text.length <= 0 || _controller_pwd.text.length <= 0)
    {
      CustomDialog.ShowAlertDialog(context,true,
      (){Navigator.pop(context,true);},
      (){Navigator.pop(context,false);},content: "用户名或者密码不能为空！");
      return;
    }
    Navigator.popAndPushNamed(context, BankingDashboard.tag);
  }


  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(Banking_lbl_SignIn, style: boldTextStyle(size: 30)),
                EditText(text: "手机号码/卡号", isPassword: false,mController: _controller_userid,keyboard_type: TextInputType.number,),
                // TextField(
                //   decoration: InputDecoration(labelText: "手机号码/卡号",hintText: "手机号码/卡号"),
                //   controller: _controller_userid,
                //   keyboardType: TextInputType.number,
                // ),
                8.height,
                EditText(text: "密码", isPassword: false,mController: _controller_pwd,),
                // TextField(
                //   decoration: InputDecoration(labelText: "密码",hintText: "密码"),
                //   controller: _controller_userid,
                // ),
                8.height,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(Banking_lbl_Forgot,
                          style: secondaryTextStyle(size: 16))
                      .onTap(
                    () {
                      Navigator.pushNamed(context, BankingForgotPwd.tag);
                    },
                  ),
                ),
                16.height,
                CustomButton(textContent: Banking_lbl_SignLogin, onPressed: _OnLoginClicked,radius: 10,),
                16.height,
                Column(
                  children: [
                    Text(Banking_lbl_Login_with_WeChart,
                            style: primaryTextStyle(
                                size: 16, color: Banking_TextColorSecondary))
                        .onTap(() {}),
                    16.height,
                    Image.asset(Banking_ic_wechart,
                        color: Banking_Primary, height: 40, width: 40),
                  ],
                ).center(),
              ],
            ).center(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(Banking_lbl_app_Name.toUpperCase(),
                style: primaryTextStyle(
                    size: 16, color: Banking_TextColorSecondary)),
          ).paddingBottom(16),
        ],
      ),
    );
  }
}
