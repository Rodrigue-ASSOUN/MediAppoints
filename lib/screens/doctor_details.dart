import 'package:flutter/material.dart';
import 'package: font_awesome_flutter/font_awesome.dart';
import'../components//custom_appbar.dart';

class DoctorDetails extends StatefulWidget{
  const DoctorDetails(Key ? key) : super(key : key);

  @override
  State<DoctorDetails> create{} => _DoctorDetails{};
}
class _DoctorDetailsState extends State<DoctorDetails>{
  //for favorite button
  bool isFav = false;
  @override
  widget build(BuildContext context){
    return  Scakefold(
      appBar:CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(Icons.arrow_black_ios),
        actions:[
          //Favarite Button
          onPressed: () {},
          icon: Faicon(
              isFav ? Icons.favorite_rounder: Icons.favorite_outline,
              color: Colors.red,
          ),//FaIcon
        ],
      ),//CustomAppBar
      body: SafeArea(
        child: Column(
          children:<Widget>[
            AboutDoctor(),
            DetailsBody(),
            const spacer(),
            padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                width: double.infinity,
                title:'Book Appointment',
                onpressed: (){
                  //Navigate to booking page
                  //let create that
                },
                disable: false,
              ),
            ),
            //Details of the doctor
          ],
        ),//column
      ),//SafeArea
    );//Scaffold
  }
}

class AboutDoctor extends StatelessWidget{
  const AboutDoctor({Key? key}) : super(key : key);

  @override
  Widget build(BuildContent context){
    Config().init(context);
    return Container(
      width: double.infinity,
      child Column(
        children: <Widget>[
          const CircleAvatar(
            radius:65.0,
            backgroundImage: AssetImage('assets/doctor_2.jpg'),
            backgroundColor: Colors.white,
          ),//circle Avatar
          config.spaceMedium,
          const Text(
            'Dr Richard Tan',
            style: TextStyle{
              color: Colors.black,
              fontSize: 24.0,
              fontWeigth: FontWeigth.bold,
            },
          )
          Config.spaceSmall,
          SizedBox{
            width: Config.widthSize*0.75,
            child: const Text(
              'MBBS (Internatinal Medical University, Malaysia), MRCP (Royal College od physicians, United Kingdom)',
              style: TextStyle{
                color: Colors.black,
                fontWeigth: FontWeigth.bold,
                fontSize: 15,
              },
              softWrap:true,
              textAlign:TextAlign.center,
            ),
          }
        ],
      ),
    );
  }
}

class DetailsBody extends StateslessWidget{
  const DetailsBody{{Key? key}} : super{key: key};
  @override
  Widget build(BuildContext context){
    Config().init(context);
    return Container{
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child:Column(
    crossAxisAlignement: crossAxisALignement.stretch,
      children: <widget>[
        config.spaceMedium,
         DoctorInfo(),
        Config.spaceBig,
        const Text('About Doctor',
           style: TextStyle{fontWeigth: FontWeigth.w600, fontSeize:18},
        ),
        Config.spaceSmall,
        Text(
        'Dr. Richard Tan is an experience Dentist at Sarawak. He is graduated since 2008, and completed his training at sungai buloh General Hospital.'
         style: TextStyle(
          fontWeight:FontWeigth.w500,
          height:1.5,
         ),
         softWrap:true,
         textAlign: TextAlign.justify,
         //Text
        )
      ],
    };//column
  }
}

class DoctorInfo extends StateslessWidget{
  const DoctorInfo{{Key? key}}:super{key: key};
  @override
  Widget build(BuildContext context){
    return Row{
      children: const <Widget>[
        InfoCard(
          label:'Patients',
          value:'109',
        ),//InfoCard
        const SizeBox(width: 15,),
        InfoCard(
          label:'Experiences',
          value:'10 years',
        ),
        const SizeBox(width 15,)
        InfoCard(
          label:'Rating',
          value:'4.6',
        ),
      ]
    };
  }
}

class InfoCard extends Statelesswidget{
  const InfoCard{{Key? key, required this.label, required this.value}}: super(key: key);

  @override
  Widget build(BuilContent context){
    return Expanded{
      child: Container{
         decoration: BoxDecoration{
         borderRadius:BorderRadius.circular(14),
            color: Config.primaryColor,
         },//BoxDecoration
         padding: const EdgeInsets.symetric(
           vertical:29,
           horizontal: 14,
         ),//EdgeInsets.symetric
         child: Column(
           children: const <Widget>[
              Text{
                label,
                Style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeigth:FontWeigth.w600,
                ),
              },
              const SizeBox{
                height: 10,
              },
              Text{
                value,
                style: const TextStyle{
                  color: Colors.white,
                  fontSize:15,
                  fontWeight: FontWeigth.w800,
                },
              },
           ]
         ),
      },
    }
  }
}


