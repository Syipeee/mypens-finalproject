import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/common/user_interface/loading_overlay.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/features/mahasiswa/cicilan/cicilan.dart';
import 'package:mypens/features/mahasiswa/profil_dosen/screens/profil_dosen.dart';
import 'package:provider/provider.dart';
import '../../../../common/user_interface/bottom_navigation.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/common/user_controller.dart';
import '../../../../controllers/mahasiswa/profile.dart';

class MahasiswaProfile extends StatefulWidget {
  const MahasiswaProfile({Key? key}) : super(key: key);

  @override
  State<MahasiswaProfile> createState() => _ProfileState();
}

class _ProfileState extends State<MahasiswaProfile> {
  late final _userController = Provider.of<UserController>(context);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _userController.addListener(_handleLogoutResponse);
      var profile = Provider.of<ProfileController>(context, listen: false);
      profile.getCicilan();
    });
  }


  @override
  void dispose() {
    _userController.removeListener(_handleLogoutResponse);
    super.dispose();
  }

  void _handleLogoutResponse(){
    switch(_userController.logoutResponse){
      case null:
        return;
      case ApiResponseLoading():
        return;
      case ApiResponseSucceed():
        _userController.onSucceedLogout();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              MyPensNavRoutes.login,
                  (route) => false
          );
        });
        return;
      case ApiResponseFailed():
        final errorMessage = (_userController.logoutResponse as ApiResponseFailed)
            .exception?.toString() ?? "Unknown Error";
        _userController.onDoneShowLogoutErrorMessage();

        showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  title: Text(errorMessage),
                )
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    ProfileController profileController = Provider.of<ProfileController>(context);

    return SafeArea(
        child: LoadingOverlay(
          isLoading: _userController.logoutResponse is ApiResponseLoading,
          child: Scaffold(
                appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: bluePens,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          title: const Text('Profile'),
                ),
                bottomNavigationBar: const BottomNavigation(3),
                body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                        child: Container(
                      margin: const EdgeInsets.only(top: 30),
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
                    )),
                    Positioned(
                        child: Container(
                      margin: const EdgeInsets.only(top: 70, left: 42),
                      child: ClipRRect(
                          child: Image.asset(
                        width: 70,
                        height: 70,
                        'assets/images/logo.png',
                      )),
                    ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(children: [
                    Text(
                      _userController.userEmail,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    // Text('yuzaa@it.student.pens.ac.id')
                  ]),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ProfilDosen()));
                            },
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                        child: Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff868EAF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    )),
                                    Positioned(
                                        child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 40, left: 10),
                                      child: ClipRRect(
                                          child: Image.asset(
                                        width: 40,
                                        height: 40,
                                        'assets/images/profil_dosen.png',
                                      )),
                                    ))
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 15),
                                  child: Text('Profil Dosen'),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                      if (profileController.profile != null) ...[
                        if (profileController.profile.data.length > 0) ...[
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Cicilan()));
                                },
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Positioned(
                                            child: Container(
                                          margin: const EdgeInsets.only(top: 30),
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: const Color(0xfff1c40f),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        )),
                                        Positioned(
                                            child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 40, left: 10),
                                          child: ClipRRect(
                                              child: Image.asset(
                                            width: 40,
                                            height: 40,
                                            'assets/images/cicilan.png',
                                          )),
                                        ))
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20, left: 15),
                                      child: Text('Cicilan'),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ]
                      ],
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                              _userController.onLogout();
                            },
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                        child: Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffC21D44),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    )),
                                    Positioned(
                                        child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 40, left: 10),
                                      child: ClipRRect(
                                          child: Image.asset(
                                        width: 40,
                                        height: 40,
                                        'assets/images/logout.png',
                                      )),
                                    ))
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 15),
                                  child: Text('Keluar'),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
                ),
              ),
        ));
  }
}
