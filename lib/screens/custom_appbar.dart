import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  CustomAppBar({Key? key}) : super(key : key);
  @override
  Size get preferredSize =>const Size.fromHeigth(60);
  final String? appTitle;
  final String? route;
  final FaIcon? icon;
  final List<Widget>? action;
  State<CustomAppBar> createState{} => _CustomAppBarState{};
}

class _CustomAppBar extends State<CustomAppBar>{
  @override
  widget build(BuildContext context){
      return AppBar(
        automaticallyImplyLeading:true,
        backgroundColor: Colors.white,//background color is white in this app
        elevation: 0,
        title:Text(
          widget.appTitle!,
          style:const TextStyle(
            fontSize: 20,
            color: colors.black,
          ),//TextStyle
        ),//Text
        //if icon is not set, return null
        loading: widget.icon != null ? container(
          margin: const EdgeInsets.symetric(horizontal : 10, vertical : 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: config.primaryColor,
          ),//BoxDecoration
          child: IconButtton(
            onPressed:() {
              //if route is given then
              if(widget.route != null){
                Navigator.of(context).pushName(widget.route);
              }else{
                //else just simply pop back to privous page
                Navigator.of(context).pop();
              }
            },
            icon:widget.icon!,
            iconSize:16,
            color: colors.white,
          ),
        ) : null,
        //if action is not set, return null
        actions: widget.actions ?? null,
      );//appBar
  }
}