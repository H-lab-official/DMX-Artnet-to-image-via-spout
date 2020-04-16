void eachU(int col, int row, int count){
int offX = row*offsetX-offsetX/2;
int offY = col*offsetY;

translate(offX,offY);
fill(255);
text("U "+count,-1,-2);
// [0-15]
// 15
// artnet.readDmxData(subnet, universe);
byte[] data = artnet.readDmxData(floor(count/16), count%16);
int ano = 0;
outerloop:
for(int i=0; i<16*3;i=i+3)
  for(int j=0; j<32*3;j=j+3){
    
    //fill(random(255),random(255),random(255));
   
      fill(data[ano] & 0xFF);
      
   
    //println(data[ano]& 0xFF);
    rect(j, i, 3, 3);
    ano++;
    if(ano==data.length-1){
      break outerloop;
    }
  }
translate(-offX,-offY);

}
