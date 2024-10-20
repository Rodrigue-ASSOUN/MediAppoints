import 'package: flutter/material.dart';
import 'package: lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget{
  const AppointmentBooked{{Key? key}} : super{{key: key}};
  @override
  widget build(BuildContext context){
    return Scafold(
      body: SafeArea(
        child : Column{
          mainAxisAlignement: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Lottie.asset('assets/success.json'),
            ),//Expanded
            Container{
              width:double.infinity,
              alignment:Alignement.center,
              child:const Text{
                'Successfully Booked',
                style: TextStyle{
                  fontSize: 20,
                  fontWeigth: FontWeight.bold,
                },
              },
            },//container
            const Spacer(),
            //back to Home
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical:15),
              child: Button{
                width:double.infinity,
                title:'Back to Home Page',
                onpressed: {} => Navigator.of(context).pushNamed('main'),
                disable: false,
              },
            )
          ],
        },
      ),
    );
  }
}



