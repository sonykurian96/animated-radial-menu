library animated_radial_menu;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;

class RadialMenu extends StatefulWidget {

  final List<RadialButton> children;

  final AlignmentGeometry centerButtonAlignment;

  final double centerButtonSize;

  RadialMenu({Key? key,required this.children,this.centerButtonSize=0.5,this.centerButtonAlignment = Alignment.center}):super(key: key);

  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> with SingleTickerProviderStateMixin {

  AnimationController? controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 900), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.centerButtonAlignment,
      child: SizedBox(
        width: 250,
        height: 250,
        child: RadialAnimation(controller: controller!,radialButtons: widget.children,
          centerSizeOfButton: widget.centerButtonSize,
        ),
      ),
    );
  }
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}


class RadialAnimation extends StatelessWidget {
  RadialAnimation({ Key? key, required this.controller, required this.radialButtons,this.centerSizeOfButton=0.5}) :

        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.elasticOut
          ),
        ),

        scale = Tween<double>(
          begin: centerSizeOfButton*2,  // 1.5
          end: 0.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.fastOutSlowIn
          ),
        ),

        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0, 0.7,
              curve: Curves.decelerate,
            ),
          ),
        ),

        super(key: key);

  final AnimationController controller;
  final Animation<double> rotation;
  final Animation<double> translation;
  final Animation<double> scale;
  final List<RadialButton> radialButtons;
  final double centerSizeOfButton;

  @override
  Widget build(BuildContext context) {
    double generatedAngle = 360/(radialButtons.length);
    double iconAngle;

    return AnimatedBuilder(
        animation: controller,
        builder: (context, widget) {
          return Transform.rotate(
              angle: radians(rotation.value),
              child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ...radialButtons.map((index){
                      iconAngle = radialButtons.indexOf(index)*generatedAngle;
                      return _buildButton(iconAngle,color: index.buttonColor,icon: index.icon, onPress: index.onPress);
                    }),
                    Transform.scale(
                      scale: scale.value - (centerSizeOfButton*2 - 0.25),
                      child: FloatingActionButton(
                          child: Icon(FontAwesomeIcons.timesCircle), onPressed: close, backgroundColor: Colors.red
                      ),
                    ),
                    Transform.scale(
                      scale: scale.value,
                      child: FloatingActionButton(child: Icon(FontAwesomeIcons.solidDotCircle), onPressed: open,backgroundColor: Colors.teal,),
                    )
                  ])
          );
        });
  }

  void open() {
    controller.forward();
  }

  void close() {
    controller.reverse();
  }


  Widget _buildButton(double angle, {Function? onPress, Color? color, Icon? icon }) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()..translate(
            (translation.value) * cos(rad),
            (translation.value) * sin(rad)
        ),

        child: FloatingActionButton(
            child: icon, backgroundColor: color, onPressed: (){
          onPress!();
          close();
        }, elevation: 0)
    );
  }
}

class RadialButton{

  final Color buttonColor;
  final Icon icon;
  final Function onPress;

  RadialButton({this.buttonColor=Colors.orange,required this.icon,required this.onPress});
}
