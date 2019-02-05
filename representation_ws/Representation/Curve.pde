class Curve{
  public Frame frame2;
  int myType;
  float alpha = 100;
  float dt = 1/(alpha-1);
  Boid myBoid1, myBoid2, myBoid3, myBoid4;
  Curve(Boid boid1, Boid boid2, Boid boid3, Boid boid4, int type){
    myType = type;
    myBoid1 = boid1;
    myBoid2 = boid2;
    myBoid3 = boid3;
    myBoid4 = boid4;
    frame2 = new Frame(scene){
      @Override 
      public void visit(){
        render();
      }
    };
  }
  
  void render(){
    float xPos1 = myBoid1.position.x();
    float xPos2 = myBoid2.position.x();
    float xPos3 = myBoid3.position.x();
    float xPos4 = myBoid4.position.x();
    float yPos1 = myBoid1.position.y();
    float yPos2 = myBoid2.position.y();
    float yPos3 = myBoid1.position.y();
    float yPos4 = myBoid2.position.y();
    float zPos1 = myBoid1.position.z();
    float zPos2 = myBoid2.position.z();
    float zPos3 = myBoid3.position.z();
    float zPos4 = myBoid4.position.z();
    float ax,bx,cx;
    float ay,by,cy;
    float az,bz,cz;
    float x0,x1,y0,y1,z0,z1;
    float h00,h01,h10,h11,h00b,h01b,h10b,h11b;
    float m0,m1;
    cx = 3*(xPos2 - xPos1);
    bx = 3*(xPos3 - xPos2) - cx;
    ax = xPos4 - xPos1 - cx - bx; 
    
    cy = 3*(yPos2 - yPos1);
    by = 3*(yPos3 - yPos2) - cy;
    ay = yPos4 - yPos1 - cy - by; 
    
    cz = 3*(zPos2 - zPos1);
    bz = 3*(zPos3 - zPos2) - cz;
    az = zPos4 - zPos1 - cz - bz;
    
    m0 = sqrt(pow(xPos2 - xPos1,2)+pow(yPos2 - yPos1,2)+pow(zPos1-zPos2,2));
    m1 = sqrt(pow(xPos4 - xPos3,2)+pow(yPos4 - yPos3,2)+pow(zPos4-zPos3,2));
    
        
    pushStyle();
    strokeWeight(5);
    stroke(0,0,255);
    if(myType == 0){
        for(int i = 0; i < alpha - 1; i++){
          x0 = ax * pow(i*dt,3) + bx * pow(i*dt,2) + cx * i*dt + xPos1 ;;
          x1 = ax * pow((i+1)*dt,3) + bx * pow((i+1)*dt,2) + cx * (i+1)*dt + xPos1 ;
          y0 = ay * pow(i*dt,3) + by * pow(i*dt,2) + cy * i*dt +yPos1 ;
          y1 = ay * pow((i+1)*dt,3) + by * pow((i+1)*dt,2) + cy * (i+1)*dt + yPos1 ;
          //z0 = (zPos4 -zPos1)/i;
          //z1 = (zPos4 -zPos1)/(i+1);
          z0 = az * pow(i*dt,3) + bz * pow(i*dt,2) + cz * i*dt + zPos1;
          z1 = az * pow((i+1)*dt,3) + bz * pow((i+1)*dt,2) + cz * (i+1)*dt + zPos1;
          line(x0,y0,z0,x1,y1,z1);
          print("i",i,"x0",x0,"i*dt",i*dt,"dt",dt,"    ");      
        }    
      }
      if(myType == 1){
          for(int i=0; i < alpha - 1;i++){
            h00 = 2*pow(i*dt,3)-3*pow(i*dt,2)+1;
            h10 = pow(i*dt,3)-2*pow(i*dt,2)+i*dt;
            h10 = -2*pow(i*dt,3)+3*pow(i*dt,2);
            h11 = pow(i*dt,3)-pow(i*dt,2);
            h00b = 2*pow((i+1)*dt,3)-3*pow((i+1)*dt,2)+1;
            h10b = pow((i+1)*dt,3)-2*pow((i+1)*dt,2)+i*dt;
            h10b = -2*pow((i+1)*dt,3)+3*pow((i+1)*dt,2);
            h11b = pow((i+1)*dt,3)-pow((i+1)*dt,2);
            x0 = h00*xPos1 + h10*m0 + h10*xPos4 + h11*m1 ;
            x1 = h00b*xPos1 + h10b*m0 + h10b*xPos4 + h11b*m1 ;
            y0 = h00*yPos1 + h10*m0 + h10*yPos4 + h11*m1 ;
            y1 = h00b*yPos1 + h10b*m0 + h10b*yPos4 + h11b*m1 ;
            z0 = h00*zPos1 + h10*m0 + h10*zPos4 + h11*m1 ;
            z1 = h00b*zPos1 + h10b*m0 + h10b*zPos4 + h11b*m1 ;
            line(x0,y0,z0,x1,y1,z1);
          }
      }

    popStyle();
    
    
  }
}
