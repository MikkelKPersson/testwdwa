float stepX=1;
float stepY=1;
int r=40;
int rHit=50; 
  
float ball1_X=random(600);
float ball1_Y=random(400);

float ball2_X=random(600);
float ball2_Y=random(400);

int score=0;

boolean state=false;

float display_lw=40; //length and width of the fields for displaying game data/results
float fieldW;


void setup() {
  size(640,400);
  
  fieldW=width-display_lw;
}

void draw(){
 
  background(#43AF76);
  
  strokeWeight(3);
  stroke(0);
  line(fieldW,0,fieldW,height);
  
  textSize(32);
  textAlign (CENTER);  
  if (state == false){   // one ball game info
   fill(#FFA005);
   rect(fieldW,0,display_lw,display_lw);
   fill(0);
   text("1", fieldW+display_lw/2,display_lw); 
  }

  if (state == true){   // two balls game info
   fill(#FFA005);
   rect(fieldW,display_lw,display_lw,display_lw);
   fill(0);
   text("2", fieldW+display_lw/2,2*display_lw); 
  }
  
  fill(#FFA005);
     rect(fieldW,height-display_lw,display_lw,display_lw);
     fill(0);
     text(score, fieldW+display_lw/2,height); 
    
  noStroke();
  fill(#FFA005);
  ellipse(ball1_X,ball1_Y,r,r);
  
  ball1_X += stepX;
  ball1_Y += stepY;
  
  if(ball1_X > fieldW) {
    stepX = -stepX;
  }
  if(ball1_X < 0) {
    stepX = -stepX;
  }
   
  if((ball1_Y > height)||(ball1_Y < 0)) {
    stepY = -stepY;
  }


if (keyPressed) {
    state = !state;  // toggle number of balls we are playing with
  }
  

  
}

void mousePressed(){
  if(sq(mouseX-ball1_X)+sq(mouseY-ball1_Y)<sq(rHit)/4) {
    score += 1;

  }
}
