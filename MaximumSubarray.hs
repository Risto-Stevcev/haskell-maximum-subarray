module MaximumSubarray where


max_right' :: Int -> Int -> [Int] -> Int -> Int -> (Int, Int)
max_right' _ ridx []  _ rsum = (ridx, rsum)
max_right' idx ridx (x:xs) sum rsum =
  let sum' = sum + x
      idx' = idx + 1 in
    if sum' > rsum then
      max_right' idx' idx' xs sum' sum'
    else
      max_right' idx' ridx xs sum' rsum

max_right :: [Int] -> ([Int], Int)
max_right [x] = ([x], x)
max_right list = 
  let (idx, count) = max_right' 0 0 list 0 (minBound :: Int) in 
    (take idx list, count)

max_left :: [Int] -> ([Int], Int)
max_left [x] = ([x], x)
max_left list = 
  let (idx, count) = max_right' 0 0 (reverse list) 0 (minBound :: Int) in 
    (drop ((length list) - idx) list, count)

max_crossing_subarray :: [Int] -> [Int] -> ([Int], Int)
max_crossing_subarray left [] = max_left left
max_crossing_subarray [] right = max_right right
max_crossing_subarray ls rs = 
  let (left, left_sum)   = max_left ls
      (right, right_sum) = max_right rs in
    (left ++ right, left_sum + right_sum)

max_list :: ([Int], Int) -> ([Int], Int) -> ([Int], Int) -> ([Int], Int)
max_list (left, lsum) (right, rsum) (cross, csum)
  | lsum >= rsum && lsum >= csum = (left, lsum)
  | rsum >= lsum && rsum >= csum = (right, rsum)
  | otherwise = (cross, csum)

max_subarray :: [Int] -> ([Int], Int)
max_subarray [] = ([], 0)
max_subarray [x] = ([x], x)
max_subarray list = 
  let left_max  = max_subarray left
      right_max = max_subarray right
      cross_max = max_crossing_subarray left right in
    max_list left_max right_max cross_max
  where
    mid = (length list) `div` 2
    left  = take mid list
    right = drop mid list
