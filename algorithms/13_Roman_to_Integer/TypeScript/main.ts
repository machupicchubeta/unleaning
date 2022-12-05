function romanToInt(s: string): number {
  const romans = s.split("");
  let i: number;
  let result = 0;
  for (i = 0; i < romans.length; i++) {
    if ((i + 1) < romans.length && (
      (romans[i] == "I" && (romans[i+1] == "V" || romans[i+1] == "X")) ||
      (romans[i] == "X" && (romans[i+1] == "L" || romans[i+1] == "C")) ||
      (romans[i] == "C" && (romans[i+1] == "D" || romans[i+1] == "M"))
    )) {
      result += symbolValue(romans[i] + romans[i+1]);
      i++;
    } else {
      result += symbolValue(romans[i]);
    }
  }
  return result;
};

function symbolValue(s: string): number {
  let value = 0
  switch (s) {
    case "I":
      value = 1;
      break;
    case "IV":
      value = 4;
      break;
    case "V":
      value = 5;
      break;
    case "IX":
      value = 9;
      break;
    case "X":
      value = 10;
      break;
    case "XL":
      value = 40;
      break;
    case "L":
      value = 50;
      break;
    case "XC":
      value = 90;
      break;
    case "C":
      value = 100;
      break;
    case "CD":
      value = 400;
      break;
    case "D":
      value = 500;
      break;
    case "CM":
      value = 900;
      break;
    case "M":
      value = 1_000;
      break;
  }
  return value;
}
