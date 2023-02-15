void main(List<String> arguments) {
  String nome = 'Maçã';
  double peso = 98;
  String cor = 'vermelha';
  String sabor = 'doce';
  int diasDesdeAColheita = 30;

  // Fruta fruta1 = Fruta(nome, peso, cor, sabor, diasDesdeAColheita);
  // Fruta fruta2 = Fruta("Uva", 50, "roxa", "doce", 10);

  Fruta fruta1 = Fruta(nome, peso, cor, sabor, diasDesdeAColheita);

  fruta1.printAlimento();

  Legumes mandioca = Legumes("Macaxeira", 1200, "marrom", true);
  Fruta banana1 = Fruta("Banana", 75, "Amarela", "Doce", 10);
  Nozes macadamia = Nozes("Macadâmia", 100, "Marrom", "Doce", 10, 50);
  Citricas limao = Citricas("Limão", 50, "Verde", "Azedo", 5, 9);

  mandioca.printAlimento();
  banana1.printAlimento();
  macadamia.printAlimento();
  limao.printAlimento();

  mandioca.cozinhar();
  limao.fazerSuco();
  banana1.separarIngredientes();

  macadamia.fazerMassa();
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeAColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeAColheita)
      : super(nome, peso, cor);

  void estaMadura(int diasParaMadura) {
    isMadura = diasDesdeAColheita >= diasParaMadura;
    print("A sua $nome foi colhida há $diasDesdeAColheita dias, "
        "e precisa de $diasParaMadura dias para ficar madura. "
        "Logo, a sua $nome está madura? $isMadura");
  }

  void fazerSuco() {
    print("Você fez um ótimo suco de $nome!");
  }

  @override
  void separarIngredientes() {
    print("Catar as ${nome}s");
  }

  @override
  void fazerMassa() {
    print("Misturar a fruta com Farinha, açucar e ovos");
  }

  @override
  void assar() {
    print("Assar a massa por 30 minutos");
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print("Este(a) $nome é $cor e pesa $peso gramas.");
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print("Pronto, o $nome está cozinhando!");
    } else {
      print("Não precisa cozinhar o(a) $nome");
    }
  }

  @override
  void separarIngredientes() {
    //Ver se o alimento esta cozido ou cru
    print("Separando ingredientes para fazer um bolo de $nome");
  }

  @override
  void fazerMassa() {
    //Bater os legumes
    print("Fazendo a massa do bolo de $nome");
  }

  @override
  void assar() {
    //colocar mais tempo
    print("Assando o bolo de $nome");
  }
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeAColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeAColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print("Existe refrigerante de $nome");
    } else {
      print("Não existe refrigerante de $nome");
    }
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor,
      int diasDesdeAColheita, this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeAColheita);

  @override
  void fazerMassa() {
    print('Tirar a casca');
    super.fazerMassa();
  }
}

abstract class Bolo {
  //separo os ingredientes
  void separarIngredientes();

  //faço a massa
  void fazerMassa();

  //assar
  void assar();
}
