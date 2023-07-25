import 'package:flutter/material.dart';
import 'package:flutter_application_1/remote.dart';

import 'employee.dart';

class homepage1 extends StatefulWidget {
  const homepage1({super.key});

  @override
  State<homepage1> createState() => _homepage1State();
}

class _homepage1State extends State<homepage1> {
  List<Employee>? employeee;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    
    getData();
  }

  getData() async{
    employeee = await remote().getemployeee();
    if(employeee != null) {
      setState( () {
        isLoaded = true;
      });
    }
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("posts"),
      ),
      body:Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: employeee?.length,
            itemBuilder: (context,index){
              return Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(employeee![index].email,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ), 
                          ),
                          // Text(employeee![index].email,
                          // maxLines: 3,
                          // overflow: TextOverflow.ellipsis,
                          // ),
                          //  Text(employeee![index].name,
                          // maxLines: 3,
                          // overflow: TextOverflow.ellipsis,
                          // ),
                           
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
    ),
  
    );
  }
}