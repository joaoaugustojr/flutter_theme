main() {
  Map<String, double> notasDosAlunos = {
    "João": 100,
    "Patricia": 88.4,
    "Pedro": 45.9,
    "Kamila": 80.5,
  };

  for (var value in notasDosAlunos.keys) {
    print("Aluno: $value teve nota ${notasDosAlunos[value]}");
  }

  for (var item in notasDosAlunos.entries) {
    print("Aluno: ${item.key} teve nota ${item.value}");
  }

  dynamic x = "Teste";
  x = 123;
  x = false;

  print(x);

  final int a = 5;
  const int b = 10;

  print(a);
  print(b);
}
