int cx, cy, tx, ty, fx, fy, ex, ey;
float speedRadius;
float tachRadius;
float fuelRadius;
float clockDiameter;
//declaring variables for all images
PImage dash;
PImage right;
PImage left;
PImage lights;
PImage hazard;
PImage fuel;
PImage engine;
PImage cruise;
//starting points for all needle gauges
float x = 43.5;
float ta = 43.5;
float fa = 59;
float ea = 41;
float y = 0;
PFont f;     
//defining all signal lights
int rsig = 0;
int lsig = 0;
int hsig = 0;
int fsig = 0;
int csig = 0; 
int esig = 0; 
int tsig = 0;
 
void setup() {
 //loading in all images used for the dashboard
  size(1054, 600);
  //stroke(255);
  dash = loadImage("dashboard1.jpg");
  hazard = loadImage("hazard.jpg");
  lights= loadImage("lights.jpg");
  fuel= loadImage("fuel.jpg");
  engine = loadImage("engine.jpg");
  cruise = loadImage("cruise.jpg");
  right = loadImage("right.jpg"); 
  left = loadImage("left.jpg");
  
  f = createFont("Arial",20,true); // STEP 2 Create Font
  
  //
  int radius = min(width, height) / 2;
  speedRadius = radius * 0.72;
  tachRadius = radius * 0.60;
  fuelRadius = radius * 0.72;
  
  
  //speedometer x and y
  cx = 712;
  cy = 450;
  //tachometer x and y
  tx = 347;
  ty = 450;
  //fuel indicator x and y
  fx = 977;
  fy = 460;
  //engine temp indicator x and y
  ex = 82;
  ey = 460;
  
  
}

void draw() {
  
  //main dashboard
  background(0);
  image(dash,0,0);
  dash.resize(1050, 750);
  image(dash, 0, 0);
  
 //right turn signal
 if(rsig ==1){
  right.resize(37, 40);
  image(right, 590, 216);
 }
 
 if(rsig == 0){
  fill(0);
  stroke(0);
  rect(590, 216, 37, 40);
 }
 //left turn signal 
  if(lsig==1){
  left.resize(50, 40);
  image(left, 410, 216);
  }
  
  if(lsig == 0){
  fill(0);
  stroke(0);
  rect(410, 216, 37, 40);
 }
 ///hazard lights
 if(hsig ==1){
  hazard.resize(37, 40);
  image(hazard, 505, 216);
 
  left.resize(50, 40);
  image(left, 410, 216);
 
  right.resize(37, 40);
  image(right, 590, 216);
 
 }
 
 if(hsig == 0){
  fill(0);
  stroke(0);
  rect(500, 216, 37, 40);
 }
 
 if(csig==1){
 cruise.resize(37, 40);
  image(cruise, 600, 490);
 }
 
 if(csig==0){
  fill(0);
  stroke(0);
  rect(600, 490, 37, 40);
 }
 
  if(esig ==1){
 engine.resize(37, 40);
  image(engine, 100, 390);
 }
 
 if(esig ==0){
   fill(0);
  stroke(0);
  rect(100, 390, 37, 40);
 }
 
 if(tsig==1){
 lights.resize(37, 40);
  image(lights, 505, 266);
 }
 
 if(tsig==0){
  fill(0);
  stroke(0);
  rect(505, 366, 37, 40);
 }
 
  
//odometer display
  textFont(f,18);                  // STEP 3 Specify font to be used
  textSize(16);
  fill(255);      // STEP 4 Specify font color 
  text(y,500,520);

 

  textFont(f,18);                  // STEP 3 Specify font to be used
  textSize(16);
  fill(255);   
  text("ODO:", 455,520);
  
 
  fill(137, 207, 240, 50);
  stroke(137, 207, 240);
  rect(450, 501, 135, 25);
  
  
 //outside temperature 
  textFont(f,18);                  // STEP 3 Specify font to be used
  textSize(16);
  fill(255);   
  text("87°", 355,520);
  
 
  fill(137, 207, 240, 50);
  stroke(137, 207, 240);
  rect(350, 501, 40, 25);
  
  
  //speedometer needle 
  float s = map(x, 0, 60, 0, TWO_PI) - HALF_PI;
  //tachometer needle 
  float t = map(ta, 0, 60, 0, TWO_PI) - HALF_PI;
  //fuel indicator needle 
  float f = map(fa, 0, 60, 0, TWO_PI) - HALF_PI;
  //engine temp needle 
  float e = map(ea, 0, 60, 0, TWO_PI) - HALF_PI;
  
  //speedometer needle size
  stroke(255);
  strokeWeight(4);
  line(cx, cy, cx + cos(s) * speedRadius/2.1, cy + sin(s) * speedRadius/2.1);
  //tachometer needle size
  stroke(255);
  strokeWeight(4);
  line(tx, ty, tx + cos(t) * tachRadius/1.8, ty + sin(t) * tachRadius/1.8);
  //fuel indicator needle size
  stroke(255);
  strokeWeight(4);
  line(fx, fy, fx + cos(f) * fuelRadius/5, ty + sin(f) * fuelRadius/5);
  //engine temp needle size
  stroke(255);
  strokeWeight(4);
  line(ex, ey, ex + cos(e) * fuelRadius/5, ty + sin(e) * fuelRadius/5);
  
  
  //if statements to control guages if cruise control is on 
  
  if(csig==1){
  if(x>43.5){
     fa = fa+0.01;
     y=y+0.1;
     ea = ea+0.01;
     if(ea>62){
       ea =62;
     }
     if(ea>59){
       esig =1;
     }
     if(ea<59){
       esig = 0;
     }
   }
  if(fa>79){
    fuel.resize(18, 18);
    image(fuel, 975, 358);
    x=43.5;
    ta=43.5;
  }
  
  if(x==43.5){
     ea = ea-0.01;
     if(ea<41){
       ea = 41;
     }
  }
  if(x>76.5){
    x=76.5;
  }
   if(ta>76.5){
    ta=76.5;
  }
  }
  //if cruise control is not on
  else{
    if(x>43.5){
     fa = fa+0.01;
     y=y+0.1;
     x = x-0.03;
     ta = ta-0.03;
     ea = ea+0.01;
     if(ea>62){
       ea =62;
     }
     if(x<43.5){
       x=43.5;
     }
     if(ta<43.5){
       ta=43.5;
     }
     if(ea>59){
       esig =1;
     }
     if(ea<59){
       esig = 0;
     }
     if(x>76.5){
    x=76.5;
  }
   if(ta>76.5){
    ta=76.5;
  }
   }
  if(fa>79){
    fuel.resize(18, 18);
    image(fuel, 975, 358);
    x=43.5;
    ta=43.5;
  }
  if(ea>59){
       esig =1;
     }
  if(ea<59){
       esig = 0;
     }
  if(x==43.5){
     ea = ea-0.01;
     if(ea<41){
       ea = 41;
     }
  }
  
  
  
  }

  endShape();
}
/*mapping all keys to control the meters properly
* w-speed up
* s-slow down
* h-hazard lights
* l-left blinker
* r-right blinker
* c-cruise control 
*/
void keyPressed()
{
  switch(key){
    case 'w':
   if(fa>=79){
      x=43.5;
      ta=43.5;
      break;
    }
   if(x==76.5){
      fa=fa+0.1;
      y=y+1;
      if(ta!=76.5){
        ta = ta+0.25;
        break;
      }
      if(fa>=79){
      x=43.5;
      ta=43.5;
      break;
    }
      break;
    }
 
    x = x+0.5;
    ta = ta+0.25;
    fa=fa+0.1;
    ea = ea+0.01;
    y=y+1;
    break;
    
    
    
    case 's':
    if(x==43.5&fa==43.5){
      break;
    }
    else if(fa==79){
      x=43.5;
      ta=43.5;
      break;
    }
    else if(x!=43.5&ta!=43.5){
    if(x==43.5){
      y=y+1;
      if(ta!=43.5){
       ta = ta-0.5;
      }
      break;
    }  
    x = x-0.5;
    ta = ta-0.25;
    fa=fa+0.05;
    y=y+1;
    break;
    }
    break;
    
   case 'g':
   if(fa>59){
   fa=59;
   break;
   }
   break;

   case 'r':
   if(rsig ==1){
     rsig =0;
     break;
   }
     rsig = 1;
   break;

   case 'l':
   if(lsig ==1){
     lsig =0;
     break;
   }
     lsig = 1;
   break;
   
   case 'h':
   if(hsig ==1){
     hsig =0;
     break;
   }
     hsig = 1;
   break;
   
  case 'c':
   if(csig ==1){
     csig =0;
     break;
   }
     csig = 1;
   break;
   
   case 't':
   if(tsig ==1){
     tsig =0;
     break;
   }
     tsig = 1;
   break;
   
  


  }
 
}
