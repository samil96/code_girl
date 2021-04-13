import 'package:flutter/material.dart';
import 'package:flutter_code_girl/Values/ResponsiveApp.dart';

class HeaderButton extends StatefulWidget {
  String title;
  int index;
  bool lineIsVisible;

  HeaderButton(this.index,this.title,{this.lineIsVisible=true});

  @override
  State<StatefulWidget> createState() =>_HeaderButtonState(this.index);

}

class _HeaderButtonState extends State<HeaderButton>   {

  //identificar cada boton
  int index;
  final List _isHovering = [
    false,
    false,
    false,
  ];

  ResponsiveApp responsiveApp;

  _HeaderButtonState(this.index);

  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);
    //InkWell detectar acciones que realiza el usuario en la pagina
    return  InkWell(
      onHover: (value) {
        setState(() {
          value
              ? _isHovering[this.index] = true
              : _isHovering[this.index] = false;
        });
      },
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: _isHovering[this.index]
                  ?Color(0xffA5DEE5)
                  :Color(0xff75CCE8),
            ),
          ),
          SizedBox(height: 5),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: widget.lineIsVisible?_isHovering[this.index]:widget.lineIsVisible,
            child: Container(
              height: responsiveApp.lineHznButtonHeight,
              width: responsiveApp.lineHznButtonWidth,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }


}
