color red = color(255,0,0);
int wpm = 120;
int wpmRange = 380;
String curWord = "";
StringList allWords = new StringList();
int i = 0, j=0;
float delay;
Boolean paused = false;
Slider sld;
void setup(){
  size(500,500);
  frameRate(60);
  readInFile("test1.txt");
  //sld = new Slider(float(width/2),float((height/2)+40), width/2,20,20);
  sld = new Slider(width/4, height/2+40, width/2, 16);
  textAlign(CENTER);
  stroke(3);
  fill(0,0,0);
}

void draw(){
  background(255);
  textSize(width/10);
  delay = 3600/wpm;
  sld.update();
  sld.display();
  curWord = allWords.get(i);
  
  //creates the delay between words
  if(!paused){
  if(j >= delay){
   j = 0;
  if (i < allWords.size() - 1){  i++;}
  else {i = 0;}
  }
  else j++;
  }
  fill(0);
  text(curWord,width/2,height/2);
  
  //sets the wpm as a percent of total slider length
  wpm = int((sld.getPos()*380) + 120);
  textSize(width/20);
  if (wpm > 400) fill(red);
  text("WPM:"+wpm,width/2,height-height/4);
}

void readInFile(String filename){
  BufferedReader reader = createReader(filename);
  String line = null;
 try{
  while((line = reader.readLine()) !=null){
    String[] pieces = splitTokens(line);
    for (int i=0; i < pieces.length; i++){
      allWords.append(pieces[i]);
    }
  }
 }
 catch(IOException e){
   e.printStackTrace();
 }
}

void keyReleased(){
  if(keyCode==32){
    if (!paused) paused = true;
    else paused = false;
    
  }
}

  