import Test.HUnit

--https://hackage.haskell.org/package/HUnit-1.2.5.2/docs/Test-HUnit.html

foo a = (1,2)

test1 = TestCase (assertEqual "for (foo 3)," (1,2) (foo 3))

tests = TestList [TestLabel "test1" test1]

-- runTestTT
