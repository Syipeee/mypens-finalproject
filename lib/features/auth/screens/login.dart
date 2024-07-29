import 'package:flutter/material.dart';
import 'package:mypens/common/domain/authentication/model/dosen.dart';
import 'package:mypens/common/domain/authentication/model/mahasiswa.dart';
import 'package:mypens/common/domain/authentication/model/my_pens_user.dart';
import 'package:mypens/common/domain/authentication/model/staff.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../../constants/login_screen.dart';
import '../../../constants/colors.dart';
import '../../../controllers/common/user_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  bool passwordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Keluar Aplikasi'),
              content: const Text('Yakinn kamu mau keluar? 🥺️🥺️😔️'),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    child: const Text('Ngga Jadi')),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Keluar'),
                ),
              ],
            ),
          ) ??
          false;
    }

    UserController userController = Provider.of<UserController>(context, listen: false);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: bluePens,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    return WillPopScope(
      onWillPop: showExitPopup,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: const Color(0xfff3f3f3),
        body: Center(
          child: ListView(
            children: [
              const SizedBox(height: 60),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(90),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 219, 219, 219),
                              spreadRadius: 4,
                              blurRadius: 10)
                        ]),
                                      ),
                    ClipRRect(
                      child: Image.asset(
                        width: 70,
                        height: 70,
                        'assets/images/logo.png',
                      )
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  SizedBox(height: 35,),

                  Text(
                    greetings,
                    style: TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 23)
                  ),

                  SizedBox(height: 5,),

                  Text(
                    instruction,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color.fromARGB(255, 202, 202, 202)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 35, horizontal: 50,
                ),
                child: AutofillGroup(
                  onDisposeAction: AutofillContextAction.commit,
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.email, AutofillHints.username],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                          hintText: emailHintText,
                          hintStyle: const TextStyle(color: Colors.black),
                        ),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),

                      const SizedBox(height: 15,),

                      TextField(
                        autofillHints: const [AutofillHints.password],
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            hintText: passwordHintText,
                            hintStyle: const TextStyle(color: Colors.black),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !passwordVisible,
                      ),

                      const SizedBox(
                        height: 35,
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton.icon(
                          onPressed: isLoading? null : (){
                            setState(() {
                              isLoading = true;
                            });
                            userController.loginForGeneralUser(
                              email: email,
                              password: password
                            ).then((apiResponse){
                              switch(apiResponse){
                                case ApiResponseSucceed():
                                  final user = apiResponse.data!;
                                  final nextRoute = getNextRouteBasedOnUser(user);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    nextRoute,
                                    (route) => false
                                  );
                                  break;
                                case ApiResponseFailed():
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                      AlertDialog(
                                        content: Text(
                                          apiResponse.exception?.toString() ??
                                          "Unknown Error Occured!",
                                        ),
                                      )
                                  );
                                  break;
                                default:
                                  throw Exception('Kesalahan Programmer!');
                              }

                              setState(() {
                                isLoading = false;
                              });
                            });
                          },
                          icon: isLoading
                              ? const CircularProgressIndicator(
                                  backgroundColor: yellowPens,
                                  valueColor: AlwaysStoppedAnimation(whiteColor),
                                )
                              : const Icon(Icons.login),
                          label: isLoading
                              ? const Text('')
                              : const Text(textButtonLogin),
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: bluePens,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  String getNextRouteBasedOnUser(MyPensUser user){
    if (user is Dosen){
      return MyPensNavRoutes.dosenBeranda;
    } else if (user is Staff){
      return MyPensNavRoutes.staffBeranda;
    } else if (user is Mahasiswa){
      return MyPensNavRoutes.mahasiswaBeranda;
    } else {
      throw Exception('Ada kesalahan!');
    }
  }
}
