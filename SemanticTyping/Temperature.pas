namespace SemanticTyping;

// Here we define distinct type aliases for Celcius and Kelvin to Double
// these types will be a double at runtime, but they have a unique identity.
// They're not assignment compatible.
type
  Celsius = type Double;
  Kelvin = type Double;

// ToString method for Celsius floats.
extension method Celsius.ToString: String;
begin
  exit Double(self).ToString()+'°C';
end;

// ToString method for Kelvin floats.
extension method Kelvin.ToString: String;
begin
  exit Double(self).ToString()+'K';
end;

// operator that allows explicit casting from Celsius to Kelvin
operator Explicit(aTemp: Celsius): Kelvin;
begin
  exit Kelvin(Double(aTemp) + 273.15);
end;

// operator that allows explicit casting from Kelvin to Celsius
operator Explicit(aTemp: Kelvin): Celsius;
begin
  exit Celsius(Double(aTemp) - 273.15);
end;

method TemperatureTest;
begin
  var c := Celsius(20);
  // Prints 20 °C
  writeLn('Temperature: ' + c.ToString());

  // This calls the explicit cast operator.
  var k: Kelvin := Kelvin(c);
  // Prints 293.15K
  writeLn('Temperature: ' + k.ToString());
end;

end.