classdef tBackwardCompat < matlab.unittest.TestCase
    % tBackwardCompat — Tests demonstrating backward compatibility detection.
    %
    % Test 1 (testRequiresR2025aOrNewer): Verifies the running MATLAB is
    %   R2025a or newer. Simulates code that depends on R2025a+ features.
    %   Expected: PASS on R2025b, FAIL on R2024a.
    %
    % Test 2 (testBaselinePasses): Simple arithmetic — passes everywhere.
    %   Control test confirming the framework works on both releases.

    methods (Test)

        function testRequiresR2025aOrNewer(testCase)
            % Simulates code that requires R2025a+ features.
            % Uses version('-release') to verify minimum release requirement.
            rel = version('-release');  % e.g., '2025b', '2024a'
            relYear = str2double(rel(1:4));
            relHalf = rel(5);  % 'a' or 'b'

            minYear = 2025;
            minHalf = 'a';

            meetsMinimum = (relYear > minYear) || ...
                (relYear == minYear && relHalf >= minHalf);

            testCase.verifyTrue(meetsMinimum, ...
                sprintf('This code requires R2025a or newer. Running on R%s.', rel));
        end

        function testBaselinePasses(testCase)
            % Control test — basic math, passes on any release.
            result = 2 + 2;
            testCase.verifyEqual(result, 4);
        end

    end
end
