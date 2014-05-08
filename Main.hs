import System.Environment
import System.IO  
import Control.Monad
import MaximumSubarray


convert_list :: [String] -> [Int]
convert_list = map read
getLines = liftM lines . readFile


main = do  
        (filepath:args) <- getArgs
        list <- getLines filepath
        let list' = convert_list list in
          print $ max_subarray list'
