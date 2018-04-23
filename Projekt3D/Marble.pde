class Marble
{
  float radius;
  float angle;
  float size;
  float orbitSpeed;
  Marble[] marbles;
  int planetsAmount = 0;
  PVector arrow, dodatek = new PVector();
  int planetShape = 0;
  int texture = 0;
  int isSun = 0;
  float rr = 0.01;
  float shine = 0;
  
  int R=255, G=255, B=255;
  
  PShape globe;
  
  Marble(float r, float s, float oS)
  {
    radius = r;
    size = s;
    angle = random(360);
    orbitSpeed = oS;
    
    arrow = arrow.random3D(); 
    arrow.mult(radius);
    globe = createShape(SPHERE,size);
  }
  
  PVector getVector()
  {
    return arrow; 
  }
  
  void setShine(float s)
  {
    shine = s;
  }
  
  void setShine(int p, float s)
  {
    marbles[p].shine = s;
  }
  
  void setShine(int p, int m, float s)
  {
    marbles[p].marbles[m].shine = s;
  }
  
  void setSun()
  {
    isSun=1;
  }
  
  void planetShape(int type)
  {
    planetShape = type;
    if (planetShape == 0) globe = createShape(SPHERE, size);
    else globe = createShape(BOX, size);
  }
  
  void planetShape(int p, int type)
  {
    marbles[p].planetShape = type;
    if (marbles[p].planetShape == 0) marbles[p].globe = createShape(SPHERE, marbles[p].size);
    else marbles[p].globe = createShape(BOX, marbles[p].size);
  }
 
  void planetShape(int p, int m, int type)
  {
    marbles[p].marbles[m].planetShape = type;
    if (marbles[p].marbles[m].planetShape == 0) marbles[p].marbles[m].globe = createShape(SPHERE, marbles[p].marbles[m].size);
    else marbles[p].marbles[m].globe = createShape(BOX, marbles[p].marbles[m].size);
  }
  
  void setTexture(PImage img)
  {
    globe.setTexture(img);
    texture = 1;
  }
  
  void setTexture(int p, PImage img)
  {
    marbles[p].globe.setTexture(img);
    marbles[p].texture = 1;
  }
  
  void setTexture(int p, int m, PImage img)
  {
    marbles[p].marbles[m].globe.setTexture(img);
    marbles[p].marbles[m].texture = 1;
  }
  
  void spawnPlanets(int amount)
  {
    planetsAmount = amount;
    marbles = new Marble[amount];
  }
  
  void spawnPlanets(int c, int amount)
  {
    marbles[c].spawnPlanets(amount);
  }
  
  void planetsConfig(int i, float r, float s, float oS)
  {
    marbles[i] = new Marble(r,s,oS);
  }
  
  void planetsConfig(int p, int m, float r, float s, float oS)
  {
    marbles[p].planetsConfig(m,r,s,oS); 
  }
  
  void setColors(int RED, int BLUE, int GREEN)
  {
    R = RED;
    B = BLUE;
    G = GREEN;
  }
  
    void setColors(int p, int RED, int BLUE, int GREEN)
  {
    marbles[p].R = RED;
    marbles[p].B = BLUE;
    marbles[p].G = GREEN;
  }
  
      void setColors(int p, int m, int RED, int BLUE, int GREEN)
  {
    marbles[p].marbles[m].R = RED;
    marbles[p].marbles[m].B = BLUE;
    marbles[p].marbles[m].G = GREEN;
  }
  
  void move()
  {
    angle = angle + orbitSpeed;
    for(int c = 0; c < planetsAmount; c++) marbles[c].move();
  }
  
  void justSunShow()
  {
  pushMatrix();
      if (texture == 0)
      {  
          if (planetShape == 0)
          {
            fill(R,G,B);
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);  
            noStroke();
            translate(arrow.x,arrow.y,arrow.z);
            rotate(rr);
            translate(size, size, 0);
            shininess(shine);
            sphere(size);
            //for(int c = 0; c < planetsAmount; c++) marbles[c].show();
          }
          else if(planetShape == 1)
          {
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);
            noStroke();
            translate(arrow.x,arrow.y,arrow.z);
            scale(size);
            rotate(rr);
            shininess(shine);
            shape(czajnik, 0, 0);
          }
          else
          {
            fill(R,G,B);
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);  
            noStroke();
            translate(arrow.x,arrow.y,arrow.z);
            rotate(rr);
            translate(size, size, size);
            shininess(shine);
            box(size);
            //for(int c = 0; c < planetsAmount; c++) marbles[c].show();
          }
      }
      else 
      {
          if (planetShape == 0)
          {
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);  
            noFill();
            translate(arrow.x,arrow.y,arrow.z);
            //if (isSun == 0) pointLight(255,255,255,0,0,0);
            globe.setStroke(false);        
            rotate(rr);
            shininess(shine);
            
            //Reflektory?//
            
            
            shape(globe);
            //for(int c = 0; c < planetsAmount; c++) marbles[c].show();
          }
          else if(planetShape == 1)
          {
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);
            noStroke();
            noFill();
            translate(arrow.x,arrow.y,arrow.z);
            scale(size);
            rotate(rr);
            shininess(shine);
            shape(czajnik, 0, 0);
          }
          else
          {
            fill(255);
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);  
            noStroke();
            noFill();
            translate(arrow.x,arrow.y,arrow.z);
            rotate(rr);
            shininess(shine);
            shape(globe);
            //for(int c = 0; c < planetsAmount; c++) marbles[c].show();
          }
      }
    rr = rr + 0.015;
    popMatrix();
  }
  
  void show()
  {
    pushMatrix();
      if (texture == 0)
      {  
          if (planetShape == 0)
          {
            fill(R,G,B);
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);  
            noStroke();
            translate(arrow.x,arrow.y,arrow.z);
            rotate(rr);
            shininess(shine);
            sphere(size);
            for(int c = 0; c < planetsAmount; c++) marbles[c].show();
          }
          else if(planetShape == 1)
          {
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);
            noStroke();
            translate(arrow.x,arrow.y,arrow.z);
            rotate(rr);
            scale(size);
            shininess(shine);
            shape(czajnik, 0, 0);
          }
          else
          {
            fill(R,G,B);
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);  
            noStroke();
            translate(arrow.x,arrow.y,arrow.z);
            rotate(rr);
            shininess(shine);
            box(size);
            for(int c = 0; c < planetsAmount; c++) marbles[c].show();
          }
      }
      else 
      {
          if (planetShape == 0)
          {
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            
            dodatek = xVector.copy();
            
            rotate(angle,xVector.x,xVector.y,xVector.z);  
            noFill();
            translate(arrow.x,arrow.y,arrow.z);
            globe.setStroke(false);
            //rotate(rr);
            shininess(shine);
            shape(globe);
            for(int c = 0; c < planetsAmount; c++) marbles[c].show();
          }
          else if(planetShape == 1)
          {
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);
            noStroke();
            noFill();
            translate(arrow.x,arrow.y,arrow.z);
            scale(size);
            rotate(rr);
            shininess(shine);
            shape(czajnik, 0, 0);
          }
          else
          {
            fill(255);
            PVector bolt = new PVector(1,0,1);
            PVector xVector = arrow.cross(bolt);
            rotate(angle,xVector.x,xVector.y,xVector.z);  
            noStroke();
            noFill();
            translate(arrow.x,arrow.y,arrow.z);
            rotate(rr);
            shininess(shine);
            shape(globe);
            for(int c = 0; c < planetsAmount; c++) marbles[c].show();
          }
      }
    rr = rr + 0.015;
    popMatrix();
  }
}