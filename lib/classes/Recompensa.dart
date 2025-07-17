final recompensas = [
  Recompensa('assets/images/Camisa.jpeg', 100, 'Caneca Personalizada'),
  Recompensa('assets/images/Caneca.jpeg', 50, 'Camisa Verde'),
  Recompensa('assets/images/Cupom.jpeg', 500, 'Cupom de 15% de Desconto'),
  // Adicione mais recompensas aqui
];

class Recompensa {
  final String image;
  final int points;
  final String title;

  Recompensa(this.image, this.points, this.title);
}