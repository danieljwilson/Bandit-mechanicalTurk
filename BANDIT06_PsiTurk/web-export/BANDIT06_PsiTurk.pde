//SET TOTAL TRIAL NUMBER OR NUMBER OF ROUNDS...

float winPercentageLeft;
float winPercentageRight;

float randomNumber;

//for stepping through the instructions at the beginning
int page = 0;

boolean nextTrial = false;
boolean newRound = true;
int textNum = 0;
int textPos;

//Set the selection keys
int[] lettersSmall = {114, 116, 121, 117, 102, 103, 104, 106};
int[] lettersBig = {82, 84, 89, 85, 70, 71, 72, 74, 75};

int rightIndex; 
int leftIndex;

int rightLetterSmall; 
int rightLetterBig;
int leftLetterSmall;
int leftLetterBig;

//For randomizing the left and right of the BW/Color images
int leftPos = 0+25;
int rightPos = 512 +12;
int colorPos; 
int BWPos;

//For randomizing image order
int colorImageSelect;
int BWImageSelect;
int[] colorShuffle = new int[150];
int[] BWShuffle = new int [150];
int imageCounter = 1;

//Recorded data variables
int trialTotal = 0;
int wins = 0;
int losses = 0;
float money = 0;
int round = 0;
int trial = 0;
boolean win = false;
String selected;
int leftSequentialSelect = 0;
int rightSequentialSelect = 0;
//also include the bw and color image for the trial

//Initialize Image Array
PImage[] BWimages = new PImage[153];
PImage[] images = new PImage[153];

//JavaScript connector
interface JavaScript {
  void recordData(int x, int y);
  }
  
void bindJavascript(JavaScript js) {
  javascript = js;
  }
  
JavaScript javascript;

/////////////////////////////////////////////////
//////SETUP/////
/////////////////////////////////////////////////

void setup() {

  //set screen size
  size(1024, 520);
  
  //Initialize Array
  for (int i = 0; i < colorShuffle.length; i++) {
    colorShuffle[i] = i;
    BWShuffle[i] = i;
  }
  
  //LOAD COLOR IMAGES
  for ( int i = 0; i< images.length; i++ ){
    images[i] = loadImage( "color" + i + ".jpg" );   // make sure images "0.jpg" to "11.jpg" exist
    }
    
  //LOAD BW IMAGES
  for ( int i = 0; i< BWimages.length; i++ ){
    BWimages[i] = loadImage( "bw_color" + i + ".jpg" );   // make sure images "0.jpg" to "11.jpg" exist
    }
    
    shuffle(colorShuffle);
    shuffle(BWShuffle);
}

void draw() {
  //Background color and stroke color
  background(255);
  stroke(0);

  //Each draw cycle sets a different random value between 0 and 1
  //This is used to decide whether the selection wins or loses
  //The randomNumber is compared to the selected bandit's winPercentage
  randomNumber = random(0,1);

  //INSTRUCTIONS: Describe the experiment here
  if (page==0){
    instructions();

    if(mousePressed){
      page+=1;
    }
  }
  
  //PRACTICE
  if (page>=1 && page<=3){
    //change these to EXAMPLE images
    image(images[152], width/2+12, 60);
    image(BWimages[151], 0+25, 60);
    }
   
  if (page==1) {
    page1();    
    if (key == 'g' || key == 'G') {
      page+=1;
    }
  }
  
  if (page == 2) { 
      page2();
      if (key == 'h' || key == 'H') {
          page+=1;
      }
  }
  
  if (page ==3) {
      page3();
    if (key == 'b' || key == 'B') {
          page+=1;
        }   
  }
  
   if (page==4){
    printRoundTitle();

    if (mousePressed){
      page+=1;
      key='a';
      setLetters();
    }
  }
  
  if (page == 5){  
    //////////////////
    //THE EXPERIMENT//
    //////////////////
    if(newRound){
      
        updateRound();
        newRound = false;
        imageSelect();

    }
    
    if(!newRound){
       image(images[colorImageSelect], colorPos, 60);
       image(BWimages[BWImageSelect], BWPos, 60);
       
      if(!nextTrial) {
        printRound();
        //FOR LEFT SELECTION
        if (key == leftLetterSmall || key == leftLetterBig) {
          leftSelect();
         }
        //FOR RIGHT SELECTION
        if (key == rightLetterSmall || key == rightLetterBig) {
          rightSelect();
        }
       
      upperBanner();
      text("Select an image.      Left = '" + String.fromCharCode(leftLetterBig) + "', Right ='" + String.fromCharCode(rightLetterBig) + "'", width/2-200, 38);
      //JAVA VERSION
      //text("Select an image.      Left = '" + char(leftLetterBig) + "', Right ='" + char(rightLetterBig) + "'", width/2-200, 38);
     }
      
    printEarnings();
    
    //TEXT INDICATING WIN/LOSS  
    //////////////////////////
     if(nextTrial) {
       printRound();
       printOutcome();          
       upperBanner();
       text("Press the 'B' key to continue", width/2-135, 38);
        
        if(key == 'B' || key == 'b'){
          nextTrial = false;
          setLetters();
          //After 10 trials (or 5 consecutive selections of one bandit) move on to the next round
          if (trial == 10 || leftSequentialSelect == 5 || rightSequentialSelect == 5){
            newRound = true;
            page-=1;
            leftSequentialSelect =0;
            rightSequentialSelect = 0;
          }
 
            if(javascript!=null){
              javascript.recordData(trial, win, wins, losses, money, rectangle);
            }
            
        }
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

void upperBanner(){
    fill(0,0,0,155);
    rect(width/2-240, 12, 480, 35);

    textSize(20);
    fill(255);
}

void lowerBanner(){
    fill(0,0,0,155);
    rect(width/2-150, 440, 300, 60);
      
    textSize(40);
    fill(200);
}

void setLetters(){
  rightIndex = int(random(lettersSmall.length)); 
  leftIndex = int(random(lettersSmall.length));
  
  while (rightIndex == leftIndex){
    leftIndex = int(random(lettersSmall.length));
  }
  
  rightLetterSmall = lettersSmall[rightIndex]; 
  rightLetterBig = lettersBig[rightIndex];
  leftLetterSmall = lettersSmall[leftIndex];
  leftLetterBig = lettersBig[leftIndex];
}

void shuffle(int[] a) 
{ 
  int temp; 
  int pick; 
  
   for(int i=0; i<a.length; i++) 
     { 
       temp = a[i]; 
       pick  = (int)random(5); 
       a[i] = a[pick]; 
       a[pick]= temp; 
     } 
} 

void imageSelect(){
  if (random(0,1) < 0.5){
    colorPos = rightPos;
    BWPos = leftPos;
    } else {
      colorPos = leftPos;
      BWPos = rightPos;
    }
   
   colorImageSelect = colorShuffle[imageCounter%colorShuffle.length];
   BWImageSelect = BWShuffle[imageCounter%BWShuffle.length];
   
   while (colorImageSelect == BWImageSelect){
     imageCounter+=1;
     colorImageSelect = colorShuffle[imageCounter%colorShuffle.length];
     BWImageSelect = BWShuffle[imageCounter%BWShuffle.length];
   }
   imageCounter+=1;
}

void printOutcome(){
  fill(255,255,255,100);
  rect(textPos, 190, 250, 100);
  textSize(90);
  fill(0);
       
  if(textNum ==1){
    text("WIN", textPos+38, height/2+13);
    }
  if(textNum ==2){
    text("LOSE", textPos+9, height/2+13);
    }
}

void printRound(){
  textSize(24);
  fill(0);
  text("ROUND " + round, 30, 455);
}

void printEarnings(){
  //KEEP TRACK OF EARNINGS  
  ////////////////////////
    
  //FOR JAVA VERSION
  //money = (0.05*wins - 0.05*losses);
  //FOR JAVASCRIPT VERSION  
  money = (0.05*wins - 0.05*losses).toFixed(2);
  lowerBanner();
  textSize(32);
  text("TOTAL = $" + money, width/2-122, 440+40);
}

void leftSelect(){
  if (randomNumber < winPercentageLeft) {
    win = true;
      wins +=1;
      textNum = 1;
    } else {
      win = false;
        losses +=1;
        textNum = 2;
       }
     //add datapoints to save here
     textPos = 138;
     selected = "left";
     trial++;
     nextTrial = true;
     leftSequentialSelect+=1;
     rightSequentialSelect=0;
     trialTotal++;
     print("  Total Trials: " + trialTotal);
   }

void rightSelect(){
  if (randomNumber <winPercentageRight) {
    win = true;
      wins +=1;
      textNum = 1;
    } else {
      win = false;
        losses +=1;
        textNum = 2;
        }
       //add datapoints to save here
     textPos = width/2+138;
     selected = "right";
     trial++;
     nextTrial = true;
     leftSequentialSelect=0;
     rightSequentialSelect+=1;
     trialTotal++;
     print("  trial: " + trial);
     print("Total Trials: " + trialTotal);

}

void printRoundTitle(){
  background(255);
  fill(0,0,0,30);
  rect(200, 200, 624, 120);
  textSize(90);
  fill(0);
  text("ROUND " + (round+1), 310, height/2+13);
  textSize(30);
  fill(80);
  text("Click here to continue", 360, height/2+50);
}

void updateRound(){
  winPercentageLeft = random(0.2,0.8);
  winPercentageRight = random(0.2,0.8);
  trial=0;
  round+=1;
  
  print("  Round #" + round);
  print("  Left: "+ winPercentageLeft);
  print("  Right: " + winPercentageRight);
  //print("  LeftImage: " + String(images[colorImageSelect]));
}

  //ADD INSTRUCTIONS HERE
  ///////////////////////
void instructions(){
  textSize(30);
  fill(0);
  text("Welcome to NAME OF EXPERIMENT", 50, 50);

  textSize(18);
  text("Explanation of experiment and how you win/lose money...", 50, 80);
  text("On the next screen you will practice the process.", 50, 120);
  text("The trial will begin when you see the screen 'Round 01'.", 50, 160);
  
  fill(0,0,0,100);
  rect(362,250, 300,50);
  fill(0);
  textSize(24);
  text("Click here to continue.", 383, 284);

}

void page1() {
    upperBanner();
    text("Press the 'G' key to select the left image", width/2-190, 38);

    lowerBanner();
    text("PRACTICE", width/2-90, 440+45);
}
void page2() {
    upperBanner();
    text("Press the 'H' key to select the right image", width/2-190, 38);

    lowerBanner();
    text("PRACTICE", width/2-90, 440+45);
    
    fill(255,255,255,100);
    rect(138, 190, 250, 100);
    textSize(90);
    fill(0);
       
    text("LEFT", 138+28, height/2+13);
}

void page3 () {
    upperBanner();
    text("Press the 'B' key to begin", width/2-115, 38);
    
    lowerBanner();
    text("PRACTICE", width/2-90, 440+45);
    
    fill(255,255,255,100);
    rect(width/2+113, 190, 300, 100);
    textSize(90);
    fill(0);
       
    text("RIGHT", width/2+113+18, height/2+13);
}

