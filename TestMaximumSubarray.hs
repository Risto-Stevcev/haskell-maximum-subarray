import Test.HUnit
import MaximumSubarray

list1 = [13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7]

testlist1 = TestCase $ assertEqual ""
    [18,20,-7,12] (let (subarray, cnt) = max_subarray list1 in subarray)

tests = 
    TestList [TestLabel "testlist1" testlist1] 

main = runTestTT tests
