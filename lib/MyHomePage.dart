import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if(orientation == Orientation.portrait){
              return portraitMode(context);
            }else{
              return landscapeMode(context);
            };
          },
        ),
      ),
    );
  }
}

// Home Screen Portrait Mode

portraitMode (context){
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Center(child: profileCircleAvatar()),
          SizedBox(height: 10,),
          Text('John Doe',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Wrap(
            children: [
              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',style: TextStyle(
                  fontSize: 20
              ),)

            ],
          ),
          SizedBox(height: 20,),
          profileOrientationBuilder(context),
        ],
      ),
    ),
  );
}

// Home Screen Landscape Mode
landscapeMode(context){
  return SingleChildScrollView(
    scrollDirection:Axis.vertical,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
              child: profileCircleAvatar(),
          ),
          Expanded(
            flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John Doe',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Wrap(
                    children: [
                      Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',style: TextStyle(
                          fontSize: 20
                      ),)

                    ],
                  ),
                  SizedBox(height:10),
                  profileOrientationBuilder(context)
                ],
              )
          )
        ],
      ),
    ),
  );

}


//  CircleAvatar

CircleAvatar profileCircleAvatar(){
  return CircleAvatar(
    radius: 150,
    backgroundImage: NetworkImage("https://img.freepik.com/premium-photo/circle-blue-abstract-futuristic-technology-background-technology-design-template-generative-ai_1423-9184.jpg?w=2000"),
  );
}


// profileOrientationBuilder

GridView profileOrientationBuilder(context){
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder:(context, index){
        return Image.network("https://www.humanresourcing.co.uk/wp-content/uploads/2023/08/connected-technology.jpg", fit: BoxFit.cover,);
      }
  );
}