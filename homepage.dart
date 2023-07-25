import 'package:flutter/material.dart';
import 'package:flutter_application_1/remote.dart';
import 'package:url_launcher/url_launcher.dart';

import 'employee.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
            // itemCount: 1,
            itemBuilder: (context,index){
              return Container(
                child: Row(
                  children: [
                    // Container(
                    //   height: 50,
                    //   width: 50,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(12),
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("EMPLOYEE ID: "+employeee![index].id.toString(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ), 
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            ),),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("USERNAME: "+employeee![index].username,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("NAME: "+employeee![index].name,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            ),
                          ),
                     TextButton(
                        onPressed: ()async{
                          
                          final email=Uri.parse(employeee![index].email);

                           if (await canLaunchUrl(email)) {
                      launchUrl(email);
                    } else {
                      throw 'Could not launch $email';
                    }
                  }, 
                          
                      //  var email = Uri.encodeComponent(employeee![index].email);

                      //  print(email);
                      //  var subject = Uri.encodeComponent("Hello Flutter");
                      //  var body = Uri.encodeComponent("Hi! I'm Flutter Developer");
                      // print(subject); //output: Hello%20Flutter
                      // Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                  //      Uri mail = Uri.parse("mailto:email" );
                  //     if (await launchUrl(mail)) {
                  //        launchUrl(mail);
                  //     }else{
                  //         throw 'Could not launch $email';
                  //     }
                  // }, 
                       child: Text(employeee![index].email,)),

                            TextButton(
                            onPressed: ()
                            async {
                    final call = Uri.parse('tel:+91 1-770-736-8031-56442');
                    if (await canLaunchUrl(call)) {
                      launchUrl(call);
                    } else {
                      throw 'Could not launch $call';
                    }
                  }, 
                            child: Text("PHONE NUMBER:"+employeee![index].phone,)),
                          
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