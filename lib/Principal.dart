
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  AudioPlayer audioPlayer = AudioPlayer();
  AssetSource musica = AssetSource("");
  AssetSource ratinho = AssetSource("musicas/ratinho.mp3");
  AssetSource pai = AssetSource("musicas/pai.mp3");
  AssetSource filho = AssetSource("musicas/filho.mp3");
  AssetSource uepa = AssetSource("musicas/uepa.mp3");
  AssetSource xaropinho = AssetSource("musicas/xaropinho.mp3");
  AssetSource cavalo = AssetSource("musicas/cavalo.mp3");

  double volume = 0.5;

  tocarMusica(){
    audioPlayer.play(musica);
    audioPlayer.setVolume(volume);
  }

  pausarMusica(){
    audioPlayer.pause();
  }

  pararMusica(){
    audioPlayer.stop();
  }



  @override
  Widget build(BuildContext context) {
    tocarMusica();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sonoplastia"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top:20)),
              Text("Ratinho Sonoplatia",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          Slider(
              inactiveColor: Colors.red,
              value: volume, onChanged: (valor){
            setState(() {
              volume=valor;
              audioPlayer.setVolume(volume);
            });
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                tocarMusica();
              }, child: Icon(Icons.play_arrow)),
              ElevatedButton(onPressed: (){
                pausarMusica();
              }, child: Icon(Icons.pause)),
              ElevatedButton(onPressed: (){
                pararMusica();
              }, child: Icon(Icons.stop)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Padding(padding: EdgeInsets.only(top:40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children:[
                  ElevatedButton(onPressed: (){
                  setState(() {
                    musica = ratinho;
                  },
                  );},
                    child: Text("Ratinho",style: TextStyle(
                      fontSize: 20,
                    ),)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      musica = cavalo;
                    },
                    );},
                      child: Text("Cavalo",style: TextStyle(
                        fontSize: 20,
                      ),)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      musica = uepa;
                    },
                    );},
                      child: Text("UEPAH!",style: TextStyle(
                        fontSize: 20,
                      ),)),
                ],


              )

            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children:[
                  ElevatedButton(onPressed: (){
                    setState(() {
                      musica = pai;
                    },
                    );},
                      child: Text("NÃO É O PAI",style: TextStyle(
                        fontSize: 15,
                      ),)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      musica = filho;
                    },
                    );},
                      child: Text("Calma Filho",style: TextStyle(
                        fontSize: 15,
                      ),)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      musica = xaropinho;
                    },
                    );},
                      child: Text("RAPAAAZ",style: TextStyle(
                        fontSize: 15,
                      ),)),
                ],


              )

            ],
          )

        ],
      ),
    );
  }
}
