float winPercentage01 = 0.9;
float winPercentage02 = 0.1;
float winPercentage03 = 0.9;
float winPercentage04 = 0.1;

int rect1X, rect2X, rect3X, rect4X;     // X Position of square button
int rectY;      // Y Position of square button
int rectSize = 120;     // Diameter of rect
int rectPos;
int textNum = 0;
int id = 0;
int wins = 0;
int losses = 0;

int page = 0;

float percent;
color rect1Color, rect2Color, rect3Color, rect4Color;

boolean rect1Over = false;
boolean rect2Over = false;
boolean rect3Over = false;
boolean rect4Over = false;

boolean rect1Select = false;
boolean rect2Select = false;
boolean rect3Select = false;
boolean rect4Select = false;

boolean nextTrial = false;
boolean win = false;
float randomNumber;

interface JavaScript {
  void recordData(int x, int y);
}
  
void bindJavascript(JavaScript js) {
  javascript = js;
}
  
JavaScript javascript;



void setup() {
  //set screen size
  size(800, 360);
  //size(displayWidth, displayHeight);

  //set rectangle colors
  rect1Color = color(110,110,110);
  rect2Color = color(140,140,140);
  rect3Color = color(170,170,170);
  rect4Color = color(200,200,200);

  //set rectangle position 
  rect1X = width/8-rectSize/2;
  rect2X = 3*(width/8)-rectSize/2;
  rect3X = 5*(width/8)-rectSize/2; 
  rect4X = 7*(width/8)-rectSize/2;
  
  rectY = height/2-rectSize/2;
  

}

void draw() {
  //updateMousePos(mouseX, mouseY);
  background(80);
  stroke(255);
  randomNumber = random(0,1);
  
  //DRAW AND COLOR RECTANGLES

    fill(rect1Color, 255);
    rect(rect1X, rectY, rectSize, rectSize);
  
    fill(rect2Color, 255);
    rect(rect2X, rectY, rectSize, rectSize);

    fill(rect3Color, 255);
    rect(rect3X, rectY, rectSize, rectSize);
  
    fill(rect4Color, 255);
    rect(rect4X, rectY, rectSize, rectSize);

if (page==0) {

    textSize(40);
    fill(0);
    text("1", rect1X+45, height/2+17);

        
    fill(0,0,0,155);
    rect(width/2-240, 20, 480, 35);

    textSize(20);
    fill(255);
    text("Press the '1' key to select the first rectangle", width/2-220, 45);

    if (key == '1') {
      page+=1;
      //break;
    }
}
if (page == 1) {
    textSize(40);
    fill(0);
    text("2", rect2X+45, height/2+17);
        
    fill(0,0,0,155);
    rect(width/2-240, 20, 480, 35);
      
    textSize(20);
    fill(255);
    text("Press the '2' key to select the second rectangle", width/2-220, 45);
    if (key == '2') {
        page+=1;
      }
}
if (page ==2) {
     textSize(40);
    fill(0);
    text("3", rect3X+45, height/2+17);
        
    fill(0,0,0,155);
    rect(width/2-240, 20, 480, 35);
      
    textSize(20);
    fill(255);
    text("Press the '3' key to select the third rectangle", width/2-220, 45);
  if (key == '3') {
        page+=1;
      }
}
if (page ==3) {
     textSize(40);
    fill(0);
    text("4", rect4X+45, height/2+17);
        
    fill(0,0,0,155);
    rect(width/2-240, 20, 480, 35);
      
    textSize(20);
    fill(255);
    text("Press the '4' key to select the fourth rectangle", width/2-220, 45);
  if (key == '4') {
        page+=1;
      }
}
if (page ==4) {
        
    fill(0,0,0,155);
    rect(width/2-240, 20, 480, 35);
      
    textSize(20);
    fill(255);
    text("Press the 'B' key to begin", width/2-220, 45);
  if (key == 'b' || key == 'B') {
        page+=1;
      }   
}
if (page ==5){  
   //SELECT RECTS AND RECORD DATA 
   if(!nextTrial) {
       if (key == '1') {
         if (randomNumber < winPercentage01) {
           rect1Color = color(50,200,50);
        
            win = true;
            wins +=1;
            rectPos = rect1X;
            textNum = 1;
        } else {
            rect1Color = color(200,50,50);
          
            win = false;
            losses +=1;
            rectPos = rect1X;
            textNum = 2;
        }
        //save data to JSON
        id++;
        nextTrial = true;
      }
  
      if (key== '2') {
        if (randomNumber <winPercentage02) {
          rect2Color = color(50,200,50);
         
          win = true;
          wins +=1;
          rectPos = rect2X;
          textNum = 1;
        } else {
            rect2Color = color(200,50,50);
          
            win = false;
            losses +=1;
            rectPos = rect2X;
            textNum = 2;
        }
       //save data to JSON
        id++;
        nextTrial = true;
      }
    
      if (key == '3') {
        if (randomNumber <winPercentage03) {
          rect3Color = color(50,200,50);
          
          win = true;
          wins +=1;
          rectPos = rect3X;
          textNum = 1;
        } else {
            rect3Color = color(200,50,50);
           
            win = false;
            losses +=1;
            rectPos = rect3X;
            textNum = 2;
        }    
     //save data to JSON
      id++;
      nextTrial = true;
    }
    
      if (key == '4') {
        if (randomNumber <winPercentage04) {
          rectPos = rect4X;
          rect4Color = color(50,200,50);
          
          win = true;
          wins +=1;
          textNum = 1;
        } else {
            rectPos = rect4X;
            rect4Color = color(200,50,50);
            
            win = false;
            losses +=1;
            textNum = 2;
        }
       //save data to JSON
        id++;
        nextTrial = true;
      }
       
      fill(0,0,0,155);
      rect(width/2-240, 20, 480, 35);
        
      textSize(20);
      fill(255);
      text("Make a selection using the '1', '2', '3', '4' keys", width/2-220, 45);
     }
      
    //TEXT  
      fill(0,0,0,155);
      rect(width/2-150, 8*height/9-40, 300, 60);
      
      textSize(30);
      fill(200);
      text("TOTAL = $" + (0.05*wins - 0.05*losses).toFixed(2), width/2-110, 8*height/9);
    
     if(nextTrial) {
         if(textNum ==1){
          textSize(40);
          fill(0);
          text("WIN", rectPos+18, height/2+17);
          }
          if(textNum ==2){
            textSize(40);
            fill(0);
            text("LOSE", rectPos+12, height/2+17);
          }
        fill(0,0,0,155);
        rect(width/2-150, 20, 300, 35);
        
        textSize(20);
        fill(255);
        text("Press the 'B' key to continue", width/2-135, 45);
        
        if(key == 'B' || key == 'b'){
          nextTrial = false;

            if(javascript!=null){
              javascript.recordData(wins, losses);
            }
          
          rect1Color = color(110,110,110);
          rect2Color = color(140,140,140);
          rect3Color = color(170,170,170);
          rect4Color = color(200,200,200);
        }
     }
   
}
}

boolean sketchFullScreen() {
  return false;
}


float fixDec(float n, int d) {
  return Float.parseFloat(String.format("%." + d + "f", n));
}

function jsb_recordTurkData(callback){
        psiTurk.recordTrialData({
            'trial': id,
            'wins': wins,
            'losses': losses,
            'rectangle': rectPos
        });
        psiTurk.saveData();
        callback();
    }

