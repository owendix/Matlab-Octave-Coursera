function abXor = strXorHex(a,b)
%strXorHex computes the xor of two strings a and b of diff lengths
%
% Input is assumed to be a hexadecimal string, so each pair of 
% characters can make up all values of 1 byte: 0-255 = 2^8 - 1
% These pairs are converted from hexadecimal to integer.
% In case length(a)!=length(b): they are compared starting from 
% the left-most character, and the remainder is Xord with 0s.

%convert hex pairs to non-negative integers
La=length(a);
Lb=length(b);
aDec=hex2dec(reshape(a,2,La/2)');	%column of integers
bDec=hex2dec(reshape(b,2,Lb/2)');
LaDec=La/2;
LbDec=Lb/2;
maxLDec=max(LaDec,LbDec);

abXorDec=zeros(maxLDec,1);

%pad smaller string with zeros
if LaDec < LbDec
	aDec=[aDec;zeros(LbDec-LaDec,1)];
elseif LaDec > LbDec
	bDec=[bDec;zeros(LaDec-LbDec,1)];
end

%perform xor of non-negative integers
abXorDec=bitxor(aDec,bDec);

%convert to hex string
abXor=reshape(tolower(dec2hex(abXorDec,2))',1,2*maxLDec);
