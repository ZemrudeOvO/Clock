DrawClock clock;
PFont font;

class DrawClock {
    color faceColor = color(250, 50, 100);
    //color scaleColor = color(255, 255, 255);
    color scaleColor = faceColor;

    int  scaleLength = 40;
    int scaleWidth = 10;
    int scalePos = 225;

    int faceRad = 500;

    int sPointerLength = 250;
    int sPointerWidth = 4;
    color sPointerColor = color(255);

    //int mPointerLength = 100;
    //int mPointerWidth = 10;
    //color mPointerColor = color(191, 64, 64);
    int mPointerLength = 200;
    int mPointerWidth = 4;
    color mPointerColor = color(255);

    //int hPointerLength = 50;
    //int hPointerWidth = 16;
    //color hPointerColor = color(150, 50, 50);
    int hPointerLength = 150;
    int hPointerWidth = 4;
    color hPointerColor = color(255);

    int digitalTimePosX = 50;
    int digitalTimePosY = 50;
    int digitalTimeSpace = 50;
    DrawClock() {

    }

    void drawAll() {
        smooth();
        font = loadFont("Monaco.vlw");
        textFont(font);
        displayDigitalTime();
        drawFace();
        drawScale();
        drawSecondPointer();
        drawMinutePointer();
        drawHourPointer();
    }
    
    void drawFace() {
        noStroke();
        fill(faceColor);
        ellipseMode(CENTER);    
        ellipse(width/2, height/2, faceRad, faceRad);
    }

    void drawScale() {
        fill(scaleColor);
        rectMode(CENTER);
        translate(width/2, height/2);
        for (int i = 0; i < 12; i++) {
            rotate(PI/6);
            rect(0, scalePos, scaleWidth, scaleLength);
        }
    }

    void drawSecondPointer() {
        pushMatrix();
        translate(width/2, height/2);
        rotate(PI);
        popMatrix();
        pushMatrix();
        rotate(PI/30 * second() + PI);
        rectMode(CENTER);
        fill(sPointerColor);
        rect(0, sPointerLength/2, sPointerWidth, sPointerLength);
        text(second(), 5, sPointerLength - 10);
        popMatrix();
    }

    void drawMinutePointer() {
        pushMatrix();
        translate(width/2, height/2);
        rotate(PI);
        popMatrix();
        pushMatrix();
        rotate(PI/30 * minute() + PI);
        rectMode(CENTER);
        fill(mPointerColor);
        rect(0, mPointerLength/2, mPointerWidth, mPointerLength);
        text(minute(), 5, mPointerLength - 10);
        popMatrix();
    }

    void drawHourPointer() {
        pushMatrix();
        translate(width/2, height/2);
        rotate(PI);
        popMatrix();
        pushMatrix();
        rotate(PI/12 * hour());
        rectMode(CENTER);
        fill(hPointerColor);
        rect(0, hPointerLength/2, hPointerWidth, hPointerLength);
        text(hour(), 5, hPointerLength - 10);
        popMatrix();
    }

    void displayDigitalTime() {
        font = loadFont("Monaco.vlw");
        textFont(font);
        String monoMinute;
        String monoSecond;
        if (minute() < 10) {
             monoMinute = "0" + str(minute());
        } else {
            monoMinute = str(minute());
        }
        if (second() < 10) {
            monoSecond = "0" + str(second());
        } else {
            monoSecond = str(second());
        }
        String thisTime = hour() + ":" + monoMinute + ":" + monoSecond;
        String thisDate = year() + "." + month() + "." + day();
        text(thisTime, digitalTimePosX, digitalTimePosY);
        text(thisDate, digitalTimePosX, digitalTimePosY + digitalTimeSpace);
    }
}

void settings() {
    size(800, 800);
}

void setup() {
    clock = new DrawClock();
}

void draw() {
    background(200);
    clock.drawAll();
}
