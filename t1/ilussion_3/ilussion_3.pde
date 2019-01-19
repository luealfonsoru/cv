PImage img;
void setup() {
  selectInput("Seleccione una imagen", "fileSelected");
}

void fileSelected(File selection) {
  if (selection == null) {
    println("No se seleccionó una imagen");
  } else {
    img = loadImage(selection.getAbsolutePath());
    img.filter(THRESHOLD, 0.3);
    frame.setSize(img.width,img.height);
  }
}

void draw(){
  if(img != null){
     image(img, 0, 0);
  }
}
