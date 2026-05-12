function result = backwardCompatHelper(x)
% backwardCompatHelper — Doubles the input value.
%   Uses "arguments (Output)" validation block introduced in R2025a.
%   This file will cause a PARSE ERROR on R2024a and earlier.

    arguments (Input)
        x (1,1) double {mustBeFinite}
    end

    arguments (Output)
        result (1,1) double {mustBePositive}
    end

    result = x * 2;
end
