Population[] populations;
PVector goal  = new PVector(400, 50);
int obstacleAmount = 40;
int populationAmount = 5;
ArrayList<HashMap> obstacleLocations = new ArrayList();

void setup() {
    obstacleLocations = generateObstacleLocationAndVelocity();
    size(800, 800); //size of the window
    frameRate(1000);//increase this to make the dots go faster

    // generate location and velocity for obstacles
    // generate populations
    populations = new Population[populationAmount];
    for (int i = 0; i< populationAmount; i++) {
        Population population = new Population(1000); //create a new population with 1000 members
        population.id = i + 1;

        population.colors.put("red", random(255));
        population.colors.put("green", random(255));
        population.colors.put("blue", random(255));
        // generate obstacles
        population.obstacles = new Obstacle[obstacleAmount];
        for (int o = 0; o< obstacleAmount; o++) {
            Obstacle obstacle = new Obstacle();
            HashMap map = obstacleLocations.get(o);
            obstacle.setup((float) map.get("startLocationX"), (float) map.get("startLocationY"), (float) map.get("startVelocityX"), (float) map.get("startVelocityY"));
            population.obstacles[o] = obstacle;
        }

        // add population to populations
        populations[i] = population;
    }
}


void draw() {
    background(255);
    stroke(255, 0);

    //draw goal
    fill(0, 0, 0);
    ellipse(goal.x, goal.y, 10, 10);

    //draw obstacle(s)
    fill(255, 0, 0);

    for (Population population : populations) {
        for (Obstacle obstacle : population.obstacles) {
            obstacle.draw(((Number) population.colors.get("red")).intValue(), ((Number) population.colors.get("green")).intValue(), ((Number) population.colors.get("blue")).intValue());
        }
        if (population.allDotsDead(population.obstacles, obstacleLocations)) {
            //genetic algorithm
            population.calculateFitness();
            population.naturalSelection();
            population.mutateDemBabies();
        } else {
            //if any of the dots are still alive then update and then show them
            population.update(population.obstacles);
        }
        population.show(((Number) population.colors.get("red")).intValue(), ((Number) population.colors.get("green")).intValue(), ((Number) population.colors.get("blue")).intValue());
    }
}

private float setStartVelocityX() {
    float startVelocityX;
    if (random(2) >= 1) {
        startVelocityX = random(3); 
    } else {
        startVelocityX = -1 * random(3);
    }
    return startVelocityX;
}

private ArrayList<HashMap> generateObstacleLocationAndVelocity() {
    ArrayList<HashMap> locations = new ArrayList();
    for (int i = 0; i < obstacleAmount; i++) {
        // obstacle start location and velocity
        float startLocationX = random(800);
        float startLocationY = random(500);
        float startVelocityX = setStartVelocityX();
        float startVelocityY = random(3);
        HashMap obstacleLocation = new HashMap();
        obstacleLocation.put("startLocationX", startLocationX);
        obstacleLocation.put("startLocationY", startLocationY);
        obstacleLocation.put("startVelocityX", startVelocityX);
        obstacleLocation.put("startVelocityY", startVelocityY);
        locations.add(obstacleLocation);
    }
    return locations;
}
