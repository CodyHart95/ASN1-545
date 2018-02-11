color red = color(255,0,0), blue = color(0,0,255), green = color(0,179,0);
int wpm = 120;
int wpmRange = 380;
String curWord = "";
StringList allWords = new StringList();
int i = 0, j=0;
float delay;
Boolean paused = false;
String t = ", . ; , [ ] ] \\ / * - + ~ ! @ # $ % ^ & ( ) { } : < > ? | _ = \" ";
int fontSize;
Slider sld;

void setup(){
  size(1000,500);
  frameRate(60);
  fontSize = width/12;
  readInFile("test1.txt");
   sld = new Slider(width/4,height/1.5+fontSize, width/2, 20);
  stroke(3);
  fill(0,0,0);
}

void draw(){
  background(255);
  curWord = allWords.get(i);
  delay = 3600/wpm;
  wpm = int((sld.getSldPos()*380) + 120);
  if (wpm < 200) sld.setTextColor(blue);
  else if (wpm >= 200 && wpm <= 399) sld.setTextColor(green);
  else if (wpm > 400) sld.setTextColor(red);
  sld.setMiddleLbl("WPM: " + wpm);
  sld.update();
  sld.display();
  textAlign(CENTER);
  textSize(fontSize);
  
  //creates the delay between words
  if(!paused){
  if(j >= delay){
   j = 0;
  if (i < allWords.size() - 1)  i++;
  else i = 0;
  }
  else j++;
  }
  fill(0);
  text(curWord,width/2,height/2);
}

void readInFile(String filename){
  BufferedReader reader = createReader(filename);
  String line = null;
 try{
  while((line = reader.readLine()) !=null){
    String[] pieces = splitTokens(line, t);
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


  