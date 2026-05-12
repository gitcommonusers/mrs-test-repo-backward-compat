classdef tBackwardCompat < matlab.unittest.TestCase
    % tBackwardCompat — Tests that exercise R2025a+ functionality.
    %
    % Test 1 (testOutputArgumentValidation): Calls a helper function that
    %   uses "arguments (Output)" block — a language feature introduced in
    %   R2025a. On R2024a this causes a parse error.
    %   Expected: PASS on R2025b, FAIL on R2024a.
    %
    % Test 2 (testBaselinePasses): Simple arithmetic — passes everywhere.
    %   Control test confirming the framework works on both releases.

    methods (Test)

        function testOutputArgumentValidation(testCase)
            % Calls helper that uses "arguments (Output)" — R2025a+ only.
            % R2024a cannot parse this syntax and will error.
            result = backwardCompatHelper(21);
            testCase.verifyEqual(result, 42, ...
                'Helper should double the input.');
        end

        function testBaselinePasses(testCase)
            % Control test — basic math, passes on any release.
            result = 2 + 2;
            testCase.verifyEqual(result, 4);
        end

    end
end
