function setup() {
    createCanvas(windowWidth, 400);
    cenario = new Cenario();
  }
  function draw() {
  
    background(255);
    print(windowWidth, windowHeight);
  
  
    cenario.windowResponse(windowWidth, windowHeight);
    
    rotate((2*PI)*0.01);
    cenario.circle(circPos);
    cenario.rectangle();
  }
  