import 'package:flutter/material.dart';
import 'package:opencv/opencv.dart' as cv2;
import 'dart:io' as Io;
import 'package:camera/camera.dart';

void main() => runApp(MaterialApp(home: Cam()));


class Cam extends StatefulWidget {
  @override
  _CamState createState() => _CamState();
}

class _CamState extends State<Cam> {

  CameraController cc;//faz a conexao
  List cam;//recebe uma lista, normalmente são 2 elementos. cam[0] = cam_back, cam[1] = cam_front
  int selectCamIdx;//indice da camera selecionada
  String camPath;//caminho da imagem que será capturada  

  @override
  void initState() {

    super.initState();
    
    availableCameras().then((availableCameras){
    
      cam = availableCameras;//capturas as cams disponiveis
      if(cam.length > 0){
      
        setState(() {
          selectCamIdx = 0;   
        });
        _initCameraController(cam[selectCamIdx]).then((void v) {});
      
      }else{
        print('no cam available mannn');
      }

    });catchError(err)=> print("Ta errado ksks");


  }

  //responsavel pela inicialização do objeto assíncrono que controla a camera. retorna um future
  Future _initCameraController(CameraDescription cameraDescription) async {//O argumento é qual tipo de camera voce irá capturar/usar, frontal ou de self.
    if(cc != null){
      await cc.dispose();
    }
    cc = CameraController(cameraDescription, ResolutionPreset.high);//argumentos: qual cam, qualidade da img que deve ser capturada(high,medium, low)
    cc.addListener(() {//deve ser chamado quando o objeto controle trocar
      if(mounted){
        setState((){});
      }
      if (cc.value.hasError) {
        print('Cam error ${cc.value.errorDescription}');
      }
    });

    try{
      await cc.initialize();
    }on CameraException catch(e){
      _showCameraException(e);
    }

    if(mounted){
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OpenCV")),
    );
  }
}