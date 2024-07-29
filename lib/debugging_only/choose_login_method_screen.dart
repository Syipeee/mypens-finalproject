import 'package:flutter/material.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';

class ChooseLoginMethodScreen extends StatelessWidget {
  const ChooseLoginMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Login Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12)
              ),
              onPressed: (){
                Navigator.of(context).pushNamed(
                  MyPensNavRoutes.login,
                );
              },
              child: const Text('Login Normal'),
            ),

            const SizedBox(height: 16,),

            FilledButton(
              style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12)
              ),
              onPressed: (){
                Navigator.of(context).pushNamed(
                  MyPensNavRoutes.debugLoginDosenByNip,
                );
              },
              child: const Text('Login Debug By NIP'),
            ),
          ],
        ),
      ),
    );
  }
}
