import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mypens/base/splash_screen_view_model.dart';
import 'package:mypens/common/domain/authentication/model/dosen.dart';
import 'package:mypens/common/domain/authentication/model/mahasiswa.dart';
import 'package:mypens/common/domain/authentication/model/staff.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/controllers/common/user_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _viewModel = SplashScreenViewModel();
  late final _userController = context.read<UserController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/logo.png')
                ),

                const SizedBox(height: 12,),

                const CircularProgressIndicator(),

                const SizedBox(height: 6,),

                const Text('Menghubungkan ke server...'),
              ],
            ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future(() {
      precacheImage(const AssetImage('assets/images/sun.png'), context);
      precacheImage(const AssetImage('assets/images/moon.png'), context);
    }).then((_){
      return _viewModel.initializeAppResource();
    }).then((user)  {
      _userController.setCurrentSessionUser(user);
      final nextRoute =
        user is Mahasiswa ?
          MyPensNavRoutes.mahasiswaBeranda :
        user is Dosen ?
          MyPensNavRoutes.dosenBeranda :
        user is Staff ?
          MyPensNavRoutes.staffBeranda :
        dotenv.env['TARGET_ENVIRONMENT'] == 'debug_dosen' ?
          MyPensNavRoutes.debugChooseLoginMethod :
          MyPensNavRoutes.login;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            nextRoute, (route) => false
        );
      });
    });
  }
}
