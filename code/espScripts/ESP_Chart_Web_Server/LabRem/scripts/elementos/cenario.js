class Cenario {
    constructor() {
      this.w;
      this.h;
    }
    windowResponse(w, h) {
      let minWidth = 310;
      let maxWidth = 800;
      let fixHeight = 400;
  
      if (w > minWidth && w < maxWidth) {
        this.w = windowWidth;
        this.h = fixHeight;
      } else if (w <= minWidth) {
        this.w = minWidth;
        this.h = fixHeight;
      } else if (w >= maxWidth) {
        this.w = maxWidth;
        this.h = fixHeight;
      }
      resizeCanvas(this.w, this.h);
      background(255);
    }
    
    circle(x) {
      fill(0, 204, 0);
      circle(this.w / 2 - 200 + x, this.h - 60, 20);
    }
    
    rectangle(){
      fill(255, 204, 0);
      rect(this.w / 2 - 200, this.h - 50, 300, 10);
    }
    
    
    
  }
  