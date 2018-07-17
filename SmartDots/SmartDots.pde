
Population test;
PVector goal  = new PVector(400, 20);
ArrayList<Obstacle> obstacles = new ArrayList();
int obstacleAmount = 40;

void setup() {
  size(800, 800); //size of the window
  frameRate(1000);//increase this to make the dots go faster
  test = new Population(1000);//create a new population with 1000 members
  for (int i = 0; i< obstacleAmount; i++) {
    Obstacle obstacle = new Obstacle();
    obstacle.setup();
    obstacles.add(obstacle);
  }
}


void draw() {
  background(255);
  stroke(144);

  //draw goal
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);

  //draw obstacle(s)
  fill(255, 0, 0);

  // rect(0, 320, 600, 50);
  // rect(200, 520, 800, 50);
  for (Obstacle obstacle : obstacles) {
    obstacle.draw();
  }

  if (test.allDotsDead(obstacles)) {
    //genetic algorithm
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDemBabies();
  } else {
    //if any of the dots are still alive then update and then show them
    test.update(obstacles);
  }
  test.show();
}
