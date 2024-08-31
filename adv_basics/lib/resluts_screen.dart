import 'package:flutter/material.dart';

class ResulstScreen extends StatelessWidget{
  const ResulstScreen({super.key});
  @override

  Widget build(BuildContext context){

    return    SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),

    
    
     child:Column(children:[
      Text('data-----------'),
      const SizedBox(height: 30,),
      Text('Listofanswerand questions'),
      SizedBox(height: 30,),
      TextButton(onPressed:(){}, child: Text('Restart Quiz'),)
     ],
     ) ,
     )
     );
  }

}