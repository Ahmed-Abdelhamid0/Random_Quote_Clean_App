import 'package:clean_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback ? onPressed;
  const ErrorWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: AppColors.black,
              size: 100,
            ),
            Text('something went wrong',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            ),
          Text('please try again',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            ),
          TextButton(
            
            onPressed: (){
              if(onPressed !=null){
                onPressed!();

              }

            }, 
            child: Text('click to reload',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            ),
            ),
          ],
        ),
      ));
  }
}