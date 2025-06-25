//variables
int columnas = 4;
int filas = 4;
float[] escalas;

void setup() {
  size(800, 800);
  textSize(30);

  // escala aleatoria para cada ojo
  escalas = new float[columnas * filas];
  for (int i = 0; i < escalas.length; i++) {
    escalas[i] = random(0.3, 0.9);
  }
}

void draw() {
  background(0);

  // hora actual
  int h = hour();
  int m = minute();
  int s = second();

  // Calcular tamaños
  float H = map(h, 0, 23, 80, 220);
  float M = map(m, 0, 59, 50, 150);
  float S = map(s, 0, 59, 10, 50);

  // Dibujar ojos
  int ojo = 0;
  for (int i = 0; i < columnas; i++) {
    for (int j = 0; j < filas; j++) {
      float escala = escalas[ojo];
      float x = map(i, 0, columnas - 1, 100, width - 100);
      float y = map(j, 0, filas - 1, 100, height - 100);

      noStroke();
      fill(#2E36FF);
      ellipse(x, y, H * escala * 2, H * escala * 2);

      fill(#8CC5EA);
      ellipse(x, y, M * escala * 2, M * escala * 2);

      fill(0);
      ellipse(x, y, S * escala * 2, S * escala * 2);

      ojo++;
    }
  }

  //hora digital
  fill(255);
  text(nf(h, 2) + ":" + nf(m, 2) + ":" + nf(s, 2), 650, 780);
}
