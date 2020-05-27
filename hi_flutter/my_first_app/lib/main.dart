import 'package:flutter/material.dart'; //importa o pacote de todas as ferramentas que iremos usar, botões, telas etc

//o main é do sistema e não da classe

//estrutura da main
void main(){
  runApp(MaterialApp(home: new Telinha()));//não é obrigatório botar o 'new'
}

//sua classe tem que ser um widget.

class Telinha extends StatefulWidget {//classe é do tipo que só irá rodar uma única vez um função(só abre uma tela e apresenta algo) 
  @override
  _TelinhaState createState() => _TelinhaState();//cria um estado da nossa "Telinha". Esse estado vai ser construido por um Conteiner(Um tipo de Widget)
}

class _TelinhaState extends State<Telinha> {
  
  String _my_var = "";
  bool stateButton = true;
  void _Clicked(){//_name torna privado
    
    setState(() {//é tipo uma thread, aqui é colocado as funções
      if (stateButton) {
        _my_var = 'hey man!';
      }
      else{
        _my_var = "it's gone";
      }
      stateButton = !stateButton;
    });

  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Hello World")), 
      body: Padding(
        //espaço
        padding: EdgeInsets.all(150.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              child: Text("Click", style: TextStyle(fontSize: 20, color:Colors.white)), 
              onPressed: _Clicked,
            ),
            Text(_my_var)
          ],
        ),
      )
    );

    /*
    return Container(
      //vai colocar tudo no container. No caso será colocado todos os filhos.
      //tem que botar o alinhamento pq ele precisa saber o tamanho etc
      child: Text("Hello World")

    );*/
  }
}