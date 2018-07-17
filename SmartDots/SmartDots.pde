
Population population;
PVector goal  = new PVector(400, 50);
Obstacle[] obstacles;
int obstacleAmount = 40;

void setup() {
    size(800, 800); //size of the window
    frameRate(1000);//increase this to make the dots go faster
    population = new Population(1000);//create a new population with 1000 members
    obstacles = new Obstacle[obstacleAmount];
    for (int i = 0; i< obstacleAmount; i++) {
        Obstacle obstacle = new Obstacle();
        obstacle.setup();
        obstacles[i] = obstacle;
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

    for (Obstacle obstacle : obstacles) {
        obstacle.draw();
    }

    if (population.allDotsDead(obstacles)) {
        //genetic algorithm
        population.calculateFitness();
        population.naturalSelection();
        population.mutateDemBabies();
    } else {
        //if any of the dots are still alive then update and then show them
        population.update(obstacles);
    }
    population.show();
}
