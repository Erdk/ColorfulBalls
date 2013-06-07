/******************************************************************************
 * 
 * Copyright Lukas Redynk, 2013
 * lukas.redynk@gmail.com
 *
 * This file is part of ColorfulBalls.
 *
 * ColorfulBalls is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * ColorfulBalls is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with ColorfulBalls.  If not, see <http://www.gnu.org/licenses/>.
 *
 *****************************************************************************/

import java.util.Random;

Random generator;

float noiser;
float noiseg;
float noiseb;

void paint() {
  background(255);

  float sd = 120;
  float sizeSD = 60;
  float xmean = width / 2;
  float ymean = height / 2;

  for (int i = 0; i < 48 ; i++) {
    float xprob = (float) generator.nextGaussian();
    float yprob = (float) generator.nextGaussian();
    float x = xprob * sd + xmean;
    float y = yprob * sd + ymean;    
    int r =  int(map(noise(noiser), 0, 1, 0, 255));
    int g =  int(map(noise(noiseg), 0, 1, 0, 255));
    int b =  int(map(noise(noiseb), 0, 1, 0, 255));
    noiser += 10;
    noiseg += 0.01;
    noiseb += 4;
    int size = int(sizeSD * (float) generator.nextGaussian()) + 30;

    noStroke();
    fill(r, g, b, 50);
    ellipse(x, y, size, size);
  }
}

void setup() {
  size(1280, 800);
  generator = new Random();
  noiser = 0;
  noiseg = 1000;
  noiseb = 2000;
  paint();
}

void draw() {
}

void keyPressed() {
  paint();
}

