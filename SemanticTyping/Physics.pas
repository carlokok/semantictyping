namespace SemanticTyping;

type
  // Speed, Distance and Acceleration are all distinct units that are stored as a double.
  Speed = type Double;
  Distance = type Double;
  Acceleration = type Double;

// ToString for Speed; which is always in m^2
extension method Speed.ToString: String;
begin
  exit Double(self).ToString()+'m/s';
end;

// ToString for Distance; which is always in m
extension method Distance.ToString: String;
begin
  exit Double(self).ToString()+'m';
end;

// ToString for Acceleration; which is always in m/s^2
extension method Acceleration.ToString: String;
begin
  exit Double(self).ToString()+'m/s^2';
end;


// Operator to multiply speed with time, to get distance out of it: s = v * t
operator Multiply(aSpeed: Speed; aTime: TimeSpan): Distance;
begin
  exit Distance(Double(aSpeed) * aTime.TotalSeconds);
end;

// Operator to multiply acceleration with time: s = 0.5a·t^2
operator Multiply(aAcceleration: Acceleration; aTime: TimeSpan): Distance;
begin
  exit Distance(0.5 * Double(aAcceleration) * (Double(aTime.TotalSeconds) * Double(aTime.TotalSeconds)));
end;

method SpeedTest;
begin
  // Initial speed; 30 m/s
  var s := Speed(30);

  var d := s * TimeSpan.FromSeconds(10);

  // 30m/s
  writeLn('Speed: ' + s.ToString());

  // 30 * 10 = 300m
  writeLn('Distance after 10 seconds: ' + d.ToString());

  // Acceleration of 4 m/s^2
  var a := Acceleration(4);
  writeLn('Acceleration: ' + a.ToString());

  // 0.5 * 4 * 10^2 = 200m
  writeLn('Distance after 10 seconds: ' + (a * TimeSpan.FromSeconds(10)).ToString());

end;

end.