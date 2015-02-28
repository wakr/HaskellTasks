import Test.HUnit

--https://hackage.haskell.org/package/HUnit-1.2.5.2/docs/Test-HUnit.html



addLengthAndDecimal a b = -1 --modify this function



--Do not modify below this!

test1 = TestCase (assertEqual "for (addLengthAndDecimal [1,2,3] 1.0)," 4.0 (addLengthAndDecimal [1,2,3] 1.0))
test2 = TestCase (assertEqual "for (addLengthAndDecimal [] 5.0)," 5.0 (addLengthAndDecimal [] 5.0))

tests = TestList [TestLabel "test1" test1, TestLabel "test2" test2]

-- runTestTT tests to run above tests
