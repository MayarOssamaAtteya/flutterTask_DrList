import 'package:flutter/material.dart';
import 'package:sectiontask/models/doctor.dart';
import 'package:sectiontask/screens/drDetails.dart';
class drlist extends StatefulWidget {
  const drlist({Key? key}) : super(key: key);

  @override
  State<drlist> createState() => _drlistState();
}

class _drlistState extends State<drlist> {
  int selecteditems =0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //size of the screen
    return Scaffold(
      floatingActionButton: FloatingActionButton( // + button
          child:Icon(Icons.add),
        backgroundColor: Color(0xff07da5f), onPressed: () {  },


      ),
      appBar: AppBar(
        backgroundColor: Color(0xff07da5f),
        title: Text("doctor list"),
        centerTitle: true,
        leading: IconButton( // awel el app bar
          onPressed: () {},
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
      body : ListView( //3shan a2dr a scroll
        children:doctors.map((e) {
          return      Padding( //alt+enter to wrap the container with rhe padding
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: size.width,
              height: size.height/5,
              child:CardF(e),

            ),
          );
        }).toList(),
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


          setState(() {
            selecteditems =
                index; // update the selecteditem to be highlighted
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), label: "Schedule"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded), label: "Profile"),
        ]
    );
  }
  Widget CardF(Doctor doctor){
    return  GestureDetector( //to navigate between pages
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => drDetails(doctor) ));
      },
      child: Row(
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
                  Icon(Icons.star , color: Colors.amberAccent,),
                  Text(doctor.rating,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),

              Text(doctor.speciality,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),),
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(doctor.address,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54),)
                ],
              )
            ],
          )

        ],
      ),
    );
  }

}
