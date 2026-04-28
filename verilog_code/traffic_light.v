int red = 8;
int yellow = 9;
int green = 10;

int pedestrianBtn = 2;
int emergencyBtn = 3;

void setup() {
  pinMode(red, OUTPUT);
  pinMode(yellow, OUTPUT);
  pinMode(green, OUTPUT);

  pinMode(pedestrianBtn, INPUT_PULLUP);
  pinMode(emergencyBtn, INPUT_PULLUP);
}

void loop() {

  // Emergency Handling (Highest Priority)
  if (digitalRead(emergencyBtn) == LOW) {
    digitalWrite(red, LOW);
    digitalWrite(yellow, LOW);
    digitalWrite(green, HIGH); // Give priority
    delay(5000);
    return;
  }

  // Pedestrian Handling
  if (digitalRead(pedestrianBtn) == LOW) {
    digitalWrite(red, HIGH);   // Stop vehicles
    digitalWrite(yellow, LOW);
    digitalWrite(green, LOW);
    delay(5000);               // Allow crossing
    return;
  }

  // Normal Traffic Sequence
  // Red
  digitalWrite(red, HIGH);
  digitalWrite(yellow, LOW);
  digitalWrite(green, LOW);
  delay(5000);

  // Green
  digitalWrite(red, LOW);
  digitalWrite(yellow, LOW);
  digitalWrite(green, HIGH);
  delay(5000);

  // Yellow
  digitalWrite(red, LOW);
  digitalWrite(yellow, HIGH);
  digitalWrite(green, LOW);
  delay(2000);
}