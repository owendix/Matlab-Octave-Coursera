function asciiStr = hexStr2AsciiCode(hexStr)
% Input: hexadecimal string
% Converts hexadecimal pairs to decimal
% Outputs ascii character from the decimal value for that character
L=length(hexStr);
tempDec=hex2dec(reshape(hexStr,2,L/2)')';
asciiStr=char(tempDec);
