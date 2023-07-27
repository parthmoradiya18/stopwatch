import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: stop(),));
}
class stop extends StatefulWidget {
  const stop({Key? key}) : super(key: key);

  @override
  State<stop> createState() => _stopState();
}

class _stopState extends State<stop> {
  int watch=0,h=0,m=0,s=0;
  bool temp=false;
  @override
  void initState() {
    getdata();
  }
  Stream getdata()
  async* {
    while(temp==true)
    {
      for(s=0;s<=100;s++)
      {
        await Future.delayed(Duration(seconds: 1));
        watch = s;

        yield watch;
        if(watch==60)
        {
          m++;
          s=0;

          if(m==60)
          {
            s=0;
            m=0;
            h++;

          }
        }
      }

    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stopwatch",style: TextStyle(fontSize: 25,color: Colors.black),),backgroundColor: Colors.green,centerTitle: true,),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        StreamBuilder(stream: getdata(),initialData: 10, builder: (context, snapshot) {
            return Container(
              height: 60,
              width: 350,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.black),color: Colors.grey),
              margin: EdgeInsets.all(5),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Flexible(fit: FlexFit.loose,
                  child: Container(
                    height: 50,
                    width: 330,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black),color: Colors.grey,borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.all(5),
                    child: Text("hours: ${h} "  "minutes: ${m} " "seconds: ${s} ",style: TextStyle(fontSize: 15,color: Colors.black),),
                  ),
                ),
              ],),
            );
          },),
        ],),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          InkWell(onTap: () {
            setState(() {
              if(temp == true)
                {
                  temp=false;
                }
              else if(temp == false)
                {
                  temp=true;
                }
            });
          },
            child: Container(
              height: 50,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.black),color: Colors.grey),
              margin: EdgeInsets.all(5),
              child: (temp==false)?Text("start",style: TextStyle(fontSize: 15,color: Colors.black),):Text("stop",style: TextStyle(fontSize: 25,color: Colors.black),),

            ),
          ),

        ],),
          InkWell(onTap: () {
            setState(() {
              if(temp == true)
                {
                  s=0;
                  m=0;
                  h=0;
                  temp=false;
                }
            });
          },
            child: Container(
              height: 50,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.black),color: Colors.grey),
              margin: EdgeInsets.all(5),
              child: Text("re set",style: TextStyle(fontSize: 15,color: Colors.black),),

            ),
          ),


        ],)

    );
  }

}
