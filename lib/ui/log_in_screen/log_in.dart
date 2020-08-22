import 'package:channab/shared/colors.dart';
import 'package:channab/shared/constants.dart';
import 'package:channab/shared/size_config.dart';
import 'package:channab/ui/log_in_screen/log_in_vm.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  //mobile number and password
  String mobileNumber;
  String password;
  //text controller
  TextEditingController phoneNumController;
  TextEditingController passwordController;

  //initialize vm
  LogInVM _logInVM;

  //Globalkey declaration
  var _formKey = GlobalKey<FormState>();
  var scaffold = GlobalKey<ScaffoldState>();

  //validation initialization
  var _autoValidate = false;

  //update progress
  Stream<double> progress;
  ProgressDialog pr;

  @override
  void initState() {
    phoneNumController = TextEditingController();
    passwordController = TextEditingController();
    _logInVM = LogInVM();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: buttonBackColor,
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: SingleChildScrollView(
          child: Container(
//          height: SizeConfig.screenHeight,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: channabBackgroundColor,
                      fontFamily: fontFamilyMontserratBold,
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    "assets/images/channab_logo.png",
                    color: channabBackgroundColor,
                    width: 150,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .8,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        top: 80.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: channabBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35.0),
                              topRight: Radius.circular(35.0),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 20.0, top: 20.0, right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Mobile Number",
                                    style: TextStyle(
                                      fontFamily: fontFamilyMontserratBold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  height: 64.0,
                                  child: TextFormField(
                                    controller: phoneNumController,
                                    onChanged: (value) {
                                      mobileNumber = value;
                                    },
                                    decoration: new InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Password",
                                    style: TextStyle(
                                      fontFamily: fontFamilyMontserratBold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  height: 64.0,
                                  child: TextFormField(
                                    controller: passwordController,
                                    onChanged: (v) {
                                      password = v;
                                    },
                                    cursorColor: Colors.deepOrange,
                                    validator: (String inputP) {
                                      if (inputP.length < 5) {
                                        return "Input at least 5 digits";
                                      } else
                                        return null;
                                    },
                                    decoration: new InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          child: Icon(_obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        )),
                                    obscureText: _obscureText,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        //todo
//                                    ExtendedNavigator.ofRouter<Router>()
//                                        .pushNamed(Routes.forgetPasswordPage);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Forget password?",
                                          style: TextStyle(
                                              fontFamily:
                                                  fontFamilyMontserratBold,
                                              fontSize: 12.0,
                                              color: buttonBackColor),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF00B9FF),
                                    ),
                                    color: Color(0xFF00B9FF),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: MaterialButton(
                                    color: buttonBackColor,
                                    onPressed: () async {
                                      setState(() {
                                        if (_formKey.currentState.validate()) {
                                        } else {
                                          _autoValidate = true;
                                        }
                                      });
                                      internetCheck(
                                          context, "Signing...", true);
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, bottom: 20.0),
                                          child: Text(
                                            "SIGN IN",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Montserrat-Bold",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Don\'t have an account? ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: fontFamilyMontserratBold,
                                          color: textColorBlackLight,
                                          fontSize: 12),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Sign Up',
                                            style: TextStyle(
                                                fontFamily:
                                                    fontFamilyMontserratBold,
                                                fontWeight: FontWeight.bold,
                                                color: buttonBackColor,
                                                fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                //todo end
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void internetCheck(BuildContext context, String text, bool login) async {
    var result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      buildProgressDialog(context, text);
      var current = 0.10;
      progress = Stream.periodic(Duration(seconds: 1), (i) {
        current += .10;
        return current;
      });

      progress?.listen((data) {
        // update progress dialog here
        pr?.update(
            progressWidget: LiquidCircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.pink),
          // Defaults to the current Theme's accentColor.
          backgroundColor: Colors.white,
          // Defaults to the current Theme's backgroundColor.
          borderColor: Colors.red,
          borderWidth: 5.0,
          value: data.toDouble(),
          direction: Axis.vertical,
          // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
        ));
      });

      if (login) {
        _logInVM.getLogInResponse(mobileNumber, password);
      }
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "No Internet availabele!",
            style: TextStyle(color: Colors.red),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void buildProgressDialog(BuildContext context, text) async {
    pr ??= new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);

    pr?.style(
      message: text,
      progressWidget: LiquidCircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.pink),
        // Defaults to the current Theme's accentColor.
        backgroundColor: Colors.white,
        // Defaults to the current Theme's backgroundColor.
        borderColor: buttonBackColor,
        borderWidth: 5.0,
        value: .1,
        direction: Axis.vertical,
        // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
    );

    await pr.show();
  }
}
