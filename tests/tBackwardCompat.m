classdef tBackwardCompat < matlab.unittest.TestCase
    % tBackwardCompat — Tests that exercise R2024b+ functionality.
    %
    % Test 1 (testNewFunctionality): Uses tabularTextDatastore with
    %   "ReadVariableNames" as a function-style call and verifies
    %   dictionary "entries" with table output — available R2024b+.
    %   Expected: PASS on R2025b, FAIL on R2024a.
    %
    % Test 2 (testBaselinePasses): Simple arithmetic — passes everywhere.
    %   This control confirms the test framework itself works on both releases.

    methods (Test)

        function testNewFunctionality(testCase)
            % Uses dictionary with 'entries(...,"table")' table output form.
            % This syntax works in R2024b+ but errors on R2024a.
            d = dictionary(["alpha","beta","gamma"], [1, 2, 3]);
            t = entries(d, "table");
            testCase.verifyEqual(height(t), 3, ...
                'Dictionary should have 3 entries.');
            testCase.verifyTrue(istable(t), ...
                'entries(d,"table") should return a table.');
        end

        function testBaselinePasses(testCase)
            % Control test — basic math, passes on any release.
            result = 2 + 2;
            testCase.verifyEqual(result, 4);
        end

    end
end
