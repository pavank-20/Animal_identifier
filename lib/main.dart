import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Classification',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}









// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: App(),
//     );
//   }
// }

// class App extends StatefulWidget {
//   @override
//   State<App> createState() => _App();
// }

// class _App extends State<App> {
//   bool isimageloading = false;
//   List labels = [];
//   File? filepath;
//   ImagePicker picker = ImagePicker();

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       await Tflite.loadModel(
//           model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
//     });
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     Tflite.close();
//     super.dispose();
//   }

//   pickimagegallery() async {
//     var image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         filepath = File(image.path);
//       });
//       classifyimage(image);
//     }
//   }

//   pickimagecamera() async {
//     var image = await picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       setState(() {
//         filepath = File(image.path);
//       });
//       classifyimage(image);
//     }
//   }

//   classifyimage(XFile path) async {
//     var output1 = await Tflite.runModelOnImage(path: path.path, numResults: 5);
//     setState(() {
//       labels = output1!;
//       print(labels);
//       isimageloading = false;
//     });
//   }

//   Widget text(e) {
//     return Text(e['label']);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Builder(builder: (context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text("Segmentation"),
//           backgroundColor: Colors.indigo[400],
//         ),
//         body: Column(children: [
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.4,
//             width: double.infinity,
//             child: filepath != null
//                 ? (isimageloading
//                     ? const Text(
//                         "Please wait while we are loading your image",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       )
//                     : Image.file(filepath!))
//                 : const Text(
//                     "No image to show",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   isimageloading = true;
//                 });
//                 pickimagegallery();
//               },
//               child: const Text("Image from gallery")),
//           ElevatedButton(
//               onPressed: () {
//                 if (!isimageloading) {
//                   setState(() {
//                     isimageloading = true;
//                   });
//                   pickimagecamera();
//                 }
//               },
//               child: const Text("Image from camera")),
//           const SizedBox(
//             height: 20,
//           ),
//           labels.length>0?Text(labels[0]['label'],style: TextStyle(fontWeight: FontWeight.bold,height: 1.33),):SizedBox.shrink()
//         ]),
//       );
//     });
//   }
// }
