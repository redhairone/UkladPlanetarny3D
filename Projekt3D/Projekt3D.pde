import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

Marble SUN;
PShape czajnik;
PImage galaxy;

PeasyCam camera;

float X,Y,Z;



void setup()
{
  //Załadowanie wszystkich potrzebnych obrazow//
  PImage sunJPG = loadImage("sun.jpg");
  PImage marsJPG = loadImage("mars.jpg");
  PImage venusJPG = loadImage("venus.jpg");
  PImage plutoJPG = loadImage("pluto.jpg");
  PImage earthJPG = loadImage("earth.jpg");
  galaxy = loadImage("galaxy.jpg");
  
  //Utworzenie ekranu oraz PeasyCam//
  size(1600,900,P3D);
  camera = new PeasyCam(this,1000);
  
  //Konstruktor slonca//
  SUN = new Marble(0,100,0);
  SUN.planetShape(0);
  SUN.setTexture(sunJPG);
  SUN.setShine(255);
  
  
  //Stworzenie planet//
  SUN.spawnPlanets(4);
  
  //Skonfigurowanie pierwszej planet//
  SUN.planetsConfig(0,200,20,0.005);
  //SUN.planetShape(0,2);
  SUN.setTexture(0,marsJPG);
  
  //Skonfigurowanie drugiej planety//
  SUN.planetsConfig(1,260,20,0.005);
  SUN.planetShape(1,1);
  SUN.setTexture(1,venusJPG);
  
  //Skonfigurowanie trzeciej planety//
  SUN.planetsConfig(2,370,100,0.014);
  SUN.planetShape(2,2);
  SUN.setTexture(2,earthJPG);
  
  //Skonfigurowanie czwartej planety//
  SUN.planetsConfig(3,470,30,0.014);
  SUN.setTexture(3,plutoJPG);
  SUN.setShine(3,1);
  
  
  
  
  
  //Ksiezyce pierwszej planety//
  SUN.spawnPlanets(0,2);
  SUN.planetsConfig(0,0,30,6,0.009);
  SUN.planetShape(0,0,1);
  SUN.planetsConfig(0,1,40,10,0.009);
  SUN.setColors(0,1,30,134,100);
  
  //KSIEZYCE//
  SUN.spawnPlanets(2,3);
  SUN.planetsConfig(2,0,95,6,0.009);
  SUN.setColors(2,0,105,117,199);
  SUN.planetsConfig(2,1,105,14,0.009);
  SUN.setColors(2,1,int(random(255)),int(random(255)),int(random(255)));
  SUN.planetShape(2,1,2);
  SUN.planetsConfig(2,2,120,10,0.009);
  SUN.setColors(2,2,int(random(255)),int(random(255)),int(random(255)));
  
  //KSIEZYCE//
  SUN.spawnPlanets(3,1);
  SUN.planetsConfig(3,0,55,8,0.009);
  SUN.planetShape(3,0,1);
  
  czajnik = loadShape("teapot.obj");
  
  X = SUN.marbles[3].dodatek.x-SUN.marbles[3].size;
  Y = SUN.marbles[3].dodatek.y-SUN.marbles[3].size;
  Z = SUN.marbles[3].dodatek.z-SUN.marbles[3].size;
}



void draw()
{
  background(galaxy);
  //lights();
  //translate(0,0,300);
  
  SUN.justSunShow(); 
  
  pushMatrix();
    rotate(SUN.marbles[0].angle,SUN.marbles[0].dodatek.x,SUN.marbles[0].dodatek.y,SUN.marbles[0].dodatek.z);
    translate(SUN.marbles[0].arrow.x,SUN.marbles[0].arrow.y,SUN.marbles[0].arrow.z);
    rotate(SUN.marbles[0].rr);
    spotLight(191,13,69,0,0,0,X,Y,Z,radians(20),5);
  popMatrix();
  
  pointLight(100,100,100,0,0,0);
  //SUN.justSunShow(); 
  
  SUN.marbles[0].show();
  SUN.marbles[1].show();
  SUN.marbles[2].show();
  SUN.marbles[3].show();
  
  SUN.move();
}