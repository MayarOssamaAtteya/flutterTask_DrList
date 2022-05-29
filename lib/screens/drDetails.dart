import 'package:flutter/material.dart';
import 'package:sectiontask/models/doctor.dart';
import 'package:sectiontask/screens/drlist.dart';
class drDetails extends StatelessWidget { // stateless lw el data etghayaret mesh bt7tag t-rebuild el widget tani
Doctor doctor;
int selecteditems =3;
drDetails(this.doctor);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff07da5f),
        title: Text("Doctor Details"),
        centerTitle: true,
        leading: IconButton( // awel el app bar
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => drlist() ));
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [ //list of widget after the title
          IconButton( // awel el app bar
              onPressed: () {},
              icon: Icon(Icons.workspaces_filled,
                color: Colors.white,)
          )
        ],
      ),
      bottomNavigationBar: buttomNavBar(),
      body: ListView(
        children: [
          Row(
            children: [
              //  Image.asset('assets/images/1.jpg'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(doctor.urlphoto),
                  radius: 65,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(doctor.name,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      //Icon(Icons.star , color: Colors.amberAccent,),
                      // Text(doctor.rating,
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     color: Colors.black54,
                      //   ),
                      // )
                    ],
                  ),

                  Text(doctor.speciality,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),),

                ],
              )

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 Padding(
                   padding: const EdgeInsets.fromLTRB(0,0,0,10),
                   child: Text("Description",
                   style: TextStyle(
                     fontSize: 28,
                     fontWeight: FontWeight.bold,
                   ),
                   ),
                 ),
                 Text(doctor.short_discription,
                   style: TextStyle(
                     fontSize: 22,
                     color: Colors.black54,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0,13,0,8),
                   child: Text("Location",
                     style: TextStyle(
                       fontSize: 28,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(3,0,0,8),
                   child: Row(
                     children: [
                       Icon(Icons.location_on_outlined),
                       Text(doctor.address,
                         style: TextStyle(
                             fontSize: 20,
                             color: Colors.black54),)
                     ],
                   ),
                 ),
                 Image.asset(doctor.urlmap),
                 Container(

                   width: size.width,
                   height: 55,
                   margin: EdgeInsets.fromLTRB(5,20,5,5),


                   child: FlatButton(
                     child: Text('Request', style: TextStyle(fontSize: 20.0),),
                     color: Color(0xff07da5f),
                     textColor: Colors.white,
                     shape: RoundedRectangleBorder(side: BorderSide(
                         color: Colors.green,
                         width: 1,
                         style: BorderStyle.solid
                     ), borderRadius: BorderRadius.circular(50)),


                     onPressed: () {},
                   ),
                 ),
               ],
            ),
          )




        ],
      ),
    );
  }
Widget buttomNavBar(){
  return BottomNavigationBar(
      selectedItemColor: Color(0xff07da5f),
      currentIndex: selecteditems,
      //highlight the navbar item of index selecteditems
      onTap: (
          index) {


        //function bytnada 3aliha awel ma a select ai haga mn l bottom navbar
        // setState(() {
        //   selecteditems =
        //       index; // update the selecteditem to be highlighted
        // });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: "Notification",),
        BottomNavigationBarItem(
            icon: Icon(Icons.schedule), label: "Schedule"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded), label: "Profile"),
      ]
  );
}
}
