import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypens/common/domain/common/model/api_response.dart';
import 'package:mypens/constants/my_pens_nav_routes.dart';
import 'package:mypens/controllers/common/user_controller.dart';

class LoginDosenByNip extends StatefulWidget {
  const LoginDosenByNip({super.key});

  @override
  State<LoginDosenByNip> createState() => _LoginDosenByNipState();
}

class _LoginDosenByNipState extends State<LoginDosenByNip> {
  bool _isLoading = false;
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userController = context.read<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Login By NIP')
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textEditingController,
              ),

              const SizedBox(height: 24,),

              FilledButton(
                onPressed: _isLoading ? null : (){
                  setState(() {
                    _isLoading = true;
                  });
                  userController.fetchDataDosenOrStaffByNip(
                    nip: _textEditingController.text,
                    email: 'fakeemail@gmail.com',
                  ).then((value){
                    setState(() {
                      _isLoading = false;
                    });
                    if (value is ApiResponseSucceed){
                      Navigator.of(context)
                        .pushReplacementNamed(MyPensNavRoutes.dosenBeranda);
                    }
                  });
                },
                child: _isLoading ?
                  const CircularProgressIndicator() :
                  const Text('Enter')
              )
            ],
          ),
        ),
      );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
