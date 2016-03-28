//Brian Witte
//Project Two
//Monday Evening 6:00-10:00, CST112

float sunX, sunY;            // Position of sun
float xGold, yGold;          // Position gold bar
float xBro, yBro;            // Position of our hero-Bro
float xGoober, yGoober;      // Position of the creature
float xScooby, yScooby;      // The Dog that follows the hero
float xScrappy, yScrappy;    // The dog that follows both the hero and the dog
float dx, dy;                // Bro!!'s movement speed
int score=0, total=0;           

// SETUP: Define screen size, set modes.
void setup(){
  size( 600, 400 );
  rectMode(CENTER);
  ellipseMode(CENTER);
  reset();
}
void reset() {
  sunX=  width/4;                 
  sunY=  50;                      // Start the sun around mid morning, it then moves across the screen.
  xBro=  width/3;                 
  yBro=  height/2;                // Starts our hero at the bottom left by the door.
  xGoober= 0;
  yGoober= height;                // Our monster starts at the bottom right.
  xScooby= xBro-50;               
  yScooby= (height/2)+20;         // Scooby will start just behind our hero.
  xScrappy= xScooby-50;
  yScrappy= (height/2)+20;        // This guy stays a little bit behind the larger dog.  
  xGold= random(50, 550);
  yGold= random(50, 350);         // Random placement of gold on reset.
  dx=  random( 1.5, 3 );          
  dy=  random( -2, +2 );          // Random speed of BRO!! upon reset.
}
//DRAW:  Sky & sun plus creature and gold
void draw()
{
  scene();
  action();
  show();
  messages();
}


//SCENE: everything sationary in the environment.
void scene() {
  background( 150, 200, 250 );             // PALE Blue sky
  
  fill( 255, 255, 0 );  
  ellipse( sunX, sunY, 30, 30 );           // Yellow-y sun
  
  fill(0, 255, 0);                         //BRIGHT GREEN LAWN
  rect(300, 300, 600, 200);
  
  fill( 125, 0, 0 );
  rect( 100, 200, 100, 50 );               // Red-ish house
  triangle( 50, 175, 100, 100, 150, 175);
  
  fill(146, 111, 91);
  rect(420, 200, 20, 60);                  //Crayola Beaver-Brown Tree trunk?
  
  fill(0, 255, 0);
  ellipse(420, 150, 45, 90);               //Green Evergreen
  
  fill(146, 111, 91);
  rect(520, 200, 40, 60);                  //Crayola Beaver-Brown Tree trunk?
  
  fill(0, 255, 0);
  triangle(480, 140, 520,  40, 560, 140);
  triangle(480, 150, 520,  50, 560, 150);
  triangle(480, 160, 520,  60, 560, 160);
  triangle(480, 170, 520,  70, 560, 170);
  triangle(480, 180, 520,  80, 560, 180);
  triangle(480, 190, 520,  90, 560, 190);
  triangle(480, 200, 520, 100, 560, 200);  //Green Evergreen
  
  fill(146, 111, 91);
  rect(320, 200, 40, 60);                  //Crayola Beaver-Brown Tree trunk?
  
  fill(0, 255, 0);
  triangle(280, 140, 320,  40, 360, 140);
  triangle(280, 150, 320,  50, 360, 150);
  triangle(280, 160, 320,  60, 360, 160);
  triangle(280, 170, 320,  70, 360, 170);
  triangle(280, 180, 320,  80, 360, 180);
  triangle(280, 190, 320,  90, 360, 190);
  triangle(280, 200, 320, 100, 360, 200);  //Green Evergreen
 
  
}
//ACTION:  Sun moves across the sky, when it sets, another immediately rises
void action() {
  if (sunX > width) {
    sunX=  0;
    sunY=  random( 20, 120 );
    }
    sunX=  sunX + 5;
    //Move BRO!! towards the Gold
    xBro=  xBro  +  (xGold-xBro) / 100*dx;
    yBro=  yBro  +  (yGold-yBro) / 100*dy;            //BRO!!!'s movement
    if ( dist(xBro, yBro, xGold, yGold) <25){        //BRO!!! gets the gold
      text("+100!!!", 200, 50);
      score=  score + 100;
      xGold= random(50, 550);
      yGold= random(height/4, 350);      
    }
    xScooby=  xScooby  +  (xBro-xScooby) / 100*dx;
    yScooby=  yScooby  +  (yBro-yScooby) / 100*dy;       //Scooby the dog follows BRO!! our hero.
    //if (xBro < xScooby){
      //xScooby= xScooby*-1
      //}
    xScrappy= xScrappy +  (xScooby-xScrappy) / 150*dx;
    yScrappy= yScrappy +  (yScooby-yScrappy) / 150*dx;   //Scrappy the puppy follows Scooby, our dog, which is following the hero looking for gold.  
    
    xGoober=  xGoober  +  (xBro-xGoober) / 1000*dx;
    yGoober=  yGoober  +  (yBro-yGoober) / 800*dy;       // Goober, our monster comes after our hero. Slowly closing in.
    if ( dist(xGoober, yGoober, xBro, yBro) <20){        //BRO!!! gets the gold
      text("-100!!!", 200, 50);
      xGold= random(50, 550);
      yGold= random(height/4, 350);
    }
  }
//SHOW: Make the gold, Hero, Dog and SMaller Dog and Creature here
void show() {
  ////First we will draw our hero, or BRO!!! in this case
  stroke(0);                                           //Body
  fill(255,227,48);                                    //Lego Yellow
  rect(xBro,yBro,100,100);
                                    
  line(xBro-30,yBro+50,xBro-30,yBro+80);
  line(xBro+30,yBro+50,xBro+30,yBro+80);                //legs
                                    
  stroke(0);
  fill(0);
  rect(xBro,yBro+20,80,20);                            //mouth
                                    
  stroke(0);
  fill(255,0,0);
  rect(xBro,yBro+25,40,10);
  stroke(0);
  line(xBro,yBro+20,xBro,yBro+30);                     //tongue
                                    
  stroke(0);
  fill(255);
  ellipse(xBro,yBro-20,30,20); 
  if (xGold>xBro){
  stroke(0);
  fill(0);
  ellipse(xBro+5,yBro-20,10,10);                       //BRO!!'s eye follows the gold to the right.
  }else{
  stroke(0);
  fill(0);
  ellipse(xBro-5,yBro-20,10,10);                       //If the gold is behind BRO!!, BRO!!'s eye follows it to the left.
  }                                  
  text("BRO!!!", xBro-25, yBro+45);                    //name
  
  ////Next we will draw the dog that follows our BRO!!!
  stroke(0);                                           //Body
  fill(68, 50, 45);
  rect(xScooby, yScooby, 100, 50);

  triangle(xScooby-50, yScooby-25, xScooby-65, yScooby-25, xScooby-65, yScooby-45); //Tail

  line(xScooby-30, yScooby+25, xScooby-30, yScooby+55);//legs
  line(xScooby-27, yScooby+25, xScooby-27, yScooby+55);
  line(xScooby+30, yScooby+25, xScooby+30, yScooby+55);
  line(xScooby+27, yScooby+25, xScooby+27, yScooby+55);
  
  stroke(0);
  fill(255);
  rect(xScooby+40, yScooby+10, 20, 20);                 //Scooby's mouth
  
  fill(68, 50, 45);
  rect(xScooby+60, yScooby-20, 20, 10);                 //Scooby's snout
  
  stroke(0);
  fill(255);
  ellipse(xScooby+20, yScooby-20, 30, 20);              //Eyeball
  stroke(0);
  fill(0);
  ellipse(xScooby+20, yScooby-20, 10, 10);              //Pupil

  text("Scooby!!", xScooby-25, yScooby+15);             //Name
  
  ////Now we will draw the annoying dog (Scrappy) which will follow the other annoying dog (Scooby) around all the time.
  ////He will probably be eaten the most by our creature.
  stroke(0);                                               //Body
  fill(142, 121, 115);
  rect(xScrappy, yScrappy, 50, 20);

  triangle(xScrappy-25, yScrappy-10, xScrappy-40, yScrappy-10, xScrappy-40, yScrappy-25); //Tail

  line(xScrappy-12, yScrappy+10, xScrappy-12, yScrappy+25);//legs
  line(xScrappy-9 , yScrappy+10, xScrappy-9 , yScrappy+25);
  line(xScrappy+12, yScrappy+10, xScrappy+12, yScrappy+25);
  line(xScrappy+9 , yScrappy+10, xScrappy+9 , yScrappy+25);
  
  fill(142, 121, 115);
  rect(xScrappy+35, yScrappy-5, 20, 10);                   //Scrappy's snout
  
  stroke(0);
  fill(255);
  ellipse(xScrappy+15, yScrappy-10, 15, 10);               //Eyeball
  stroke(0);
  fill(0);
  ellipse(xScrappy+15, yScrappy-10, 5, 5);                 //Pupil

  text("Scrappy", xScrappy-25, yScrappy+5);                //Name
  
  ////Goober!!, our resident evil twin of BRO!!
  stroke(0);                        
  fill(150);
  rect(xGoober,yGoober,100,100);                            //Body
                                    
  line(xGoober-30,yGoober+50,xGoober-30,yGoober+80);
  line(xGoober+30,yGoober+50,xGoober+30,yGoober+80);        //Legs
                                    
  stroke(0);
  fill(0);
  rect(xGoober,yGoober+20,80,20);                           //Mouth
                                    
  stroke(0);
  fill(255,0,0);
  rect(xGoober,yGoober+25,40,10);
  stroke(0);
  line(xGoober,yGoober+20,xGoober,yGoober+30);              //Tongue
                                    
  stroke(0);
  fill(255);
  ellipse(xGoober,yGoober-20,30,20);
  stroke(0);
  fill(0);
  ellipse(xGoober,yGoober-20,10,10);                        //Eye
                                   
  text("Goober!!!", xGoober-25, yGoober+45);                //Name
  ////Finally the highly sought after treasure!
  stroke(0);                                                
  fill(255, 215, 0);
  rect(xGold, yGold, 40, 20);                               //Gold Bar
}
void keyPressed() {
  if (key == 'q') {
    exit();
  }
  if (key == 'r') {
    reset();
  }  
}
void messages() {
  fill(0);
  text( "Project Two-final rough draft", width/3, 10 );
  text( "Conga line.", width/3, 20 );
  text( "Press 'r', and 'q' on the keyboard to reset and quit, respectively.", 15, height*9/10 );
  text( "Brian witte / Intro to java", 15, height-15 );
  if (score != 0) {
    text( "Score:  "+score, width*2/3, 50 );
  }
}