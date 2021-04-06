function [string_with_zeros] = addFrontZeros(number)

if number >= 1 && number <= 9
            string_with_zeros = "00" + number;
elseif number >= 10 && number <= 99
    string_with_zeros = "0" + number;
else
    string_with_zeros = string(number);
end
        
end