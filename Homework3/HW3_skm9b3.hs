-- Everyone should adhere to the following guidelines to get full credit:

-- * Your submission must successfully load and typecheck in Haskell Platform to
-- get any points. For example, executing:
--      $ ghci HW3_pawpßrint.hs
-- * Change "pawprint" to your pawprint.
-- should not produce any errors. We won't attempt to grade assignments that fail to load,
-- meaning you'll get zero points for this homework. Zero. Points.

-- * Name all functions and data types exactly as they appear in the
-- assignment. Grading will be partly automated, so incorrectly named functions are
-- likely to be counted as undefined functions.

-- * The code you submit must be your own. Exceptions: you may (of course) use
-- the code we provide however you like, including examples from the slides and the
-- books.

-- * No late submissions---PLEASE START EARLY!

-- For each of the following questions, put your answer directly below the
-- question.

-- (1) You must use a text editor (e.g., vscode, vi, textpad, emacs, etc.) to prepare
--     your solution.
-- (2) You must write type declarations for each and every one of your Haskell
--     definitions.
-- (3) The program you turn in must be the product of your effort alone.

-- 1. Add type declarations to the following definitions. Try to give the most general types possible.

nums :: [Int]
nums = [1,2,3,4,5]

table :: [(Bool, Int)]
table = [(False,1),(True,2),(False,3)]

one :: a -> [a]
one x = [x]
-- EX:
--  Input: "one "hi" " > Output: "["hi"]"
--  Input: "one 2" > Output: "[2]"

three :: a -> (a, a, a)
three x = (x,x,x)
-- EX: 
--  Input: "three "hi" " > Output: "("hi", "hi", "hi")"
--  Input: "three 5" > Output: "(5,5,5)"

first :: a -> a -> a
first x y = x
-- EX:
--  Input: "first "hi" "bye" " > Output: "hi"
--  Input: "first 5 3" > Output: "5"

mult :: Float -> Float -> Float
mult m n = m * n
-- EX:
--  Input: "mult 2.3 4.5" > Output: "10.349999"
--  Input: "mult 3 5" > Output: "15.0"


-- 2. The function, second :: [a] -> a, returns the second element in a list that contains at least
--    2 elements. Define three different versions of this function using:
-- (a) head and tail
-- (b) list indexing !!
-- (c) pattern matching on the input

-- Name your functions second1, second2 and second3 and define them below.

-- (a) head and tail
second1 :: [a] -> a
second1 = head . tail
-- EX:
    -- Input: "second1 [1,2,3,4,5]" > Output: "2"
    -- Input: "second1 ["hi", "bye"]" > Output: "bye"

-- (b) list indexing !!
second2 :: [a] -> a
second2 a = a !! 1
-- EX: 
--  Input: "second2 [5,4,3,2,1]" > Output: "4"
--  Input: "second2 ["bye", "hola", "hi"]" > Output: "hola"

-- (c) pattern matching on the input
second3 :: [a] -> a
second3 xs = case xs of
    (_:y:_) -> y
    (_:[]) -> error "ERROR" 
    [] -> error "ERROR"
-- EX:
--  Input: "second3 [9,8,7,6]" > Output: "8"
--  Input: "second3 ["John", "Paul", "George", "Ringo"]" > Output: "Paul"


-- 3. The exclusive-or function, xor :: Bool -> Bool -> Bool, takes two Bool values and returns
--    True when precisely one is True, returning False otherwise. Define three versions of this
--    function using:
-- (a) pattern matching
-- (b) if then else
-- (c) the operator /= (not equal to)
--
-- Name your functions xor1, xor2 and xor3. Make your definitions as simple as possible.

-- (a) pattern matching
xor1 :: Bool -> Bool -> Bool
xor1 a b = (a || b) && not (a && b)

-- (b) if then else
xor2 :: Bool -> Bool -> Bool
xor2 a b =
    if a == True && b == True
        then False
    else if a == True && b == False
        then True
    else if a == False && b == True
        then True
    else False

-- (c) the operator /= (not equal to)
xor3 :: Bool -> Bool -> Bool
xor3 a b
    | a /= b = True
    | otherwise = False


-- 4. Using a list comprehension, define a function, sumsqr :: Int -> Int, that calculates
--    the sum of the first n integer squares. For example, sumsqr 3 = 1^2 + 2^2 + 3^2 = 14. You
--    may assume that n >= 0.

sumsqr :: Int -> Int
sumsqr n = foldr opf 0 [1..n]
    where opf x y = x * x + y

-- 5. Using a list comprehension, define a function grid :: Int -> [(Int,Int)] that returns a
--   list of all (x, y) coordinate pairs on an n X n square grid, excluding the diagonal
--   running from (0, 0) to (n, n). For example,
--
--     ghci> grid 2
--        [(0,1),(0,2),(1,0),(1,2),(2,0),(2,1)]

grid :: Int -> [(Int,Int)]
grid n = [(x, y)| x <- [0..n], y <- [0..n], x /= y]

-- 6. Define the function snoc :: a -> [a] -> [a], which takes an item and a list of items as
--    input, and returns the list with the item at the end. For example:
--        ghci> snoc 9 [1,2,3,4]
--           [1,2,3,4,9]
--
--    Notice that snoc puts an item at the end of a list and not at the head like cons.
--    To receive credit, you cannot use append (++) – you must use recursion and cons (:) only.

snoc :: a -> [a] -> [a]
snoc a [] = [a]
snoc a (x:xs) = x : snoc a xs

-- 7. Write a function, sumaps, which calculates the sum of a list on Int's in accumulator passing
--    style.

sumaps :: [Int] -> Int
sumaps xs = 
    let { 
        ys = 0 : map (\(a,b) -> a + b) (zip xs ys) 
    } in last ys

-- 8. Recall the usual factorial function definition:
--
fac 0 = 1
fac n = n * fac (n-1)

-- Write a function, facaps, that calculates factorial in accumulator passing style.

facaps :: Int -> Int
facaps n =
    if n == 0 
        then accum
    else
        fac n

accum :: Int
accum = 1

-- 10. Define a RECURSIVE function
-- called func_3a that implements euclid's algorithm
-- for calculating the greatest common divisor
-- of two integers.
--
-- This picture is helpful for understanding how Eulcid's algorithm works: 
-- https://www.google.com/url?sa=i&url=https%3A%2F%2Fscienceland.info%2Fen%2Falgebra8%2Feuclid-algorithm&psig=AOvVaw0q4BEpkmgL28JYzKXH4Q65&ust=1603845880895000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLjU5tDF0-wCFQAAAAAdAAAAABAI
--
-- Euclid's algorithm takes two integers, then first checks
-- to see if they are equal; if equal, it returns either value
-- (which is the gcd). Otherwise, the smaller value is subtracted
-- from the larger value. This is repeated until the numbers are
-- equal. The final value is the gcd of the original numbers.
-- You do not need to handle negative values.
--
--  ex:
--      INPUT: func_10 27 18
--      OUTPUT: 9
--  ex:
--      INPUT: func_10 13 100
--      OUTPUT: 1
--

func_10 :: Integer -> Integer -> Integer
func_10 x y = 
    if x == y 
        then x
    else 
        gcd x y


-- Problem 11. Write a function that takes a binary operation
--             on the Integers and a list of integers, then performs
--             the binary operation on every pair in the list.
--             If there is an odd number of items in the list, simply
--             put the last element into the last space in the returned list.
--
--  ex:
--            INPUT: func_11 (+) [1,2,3,4,5,6,7,8,9]
--            OUTPUT: [3,7,11,15,9]
--            INPUT: func_11 (+) [1,2,3,4,5,6,7,8,9,10]
--            OUTPUT: [3,7,11,15,19]
--            INPUT: func_11 mod [10,3,2,20,7]
--            OUTPUT: [1,2,7]
--
--             For list, x with even i elements, and operation f, return the list
--             [f(x[0], x[1]), f(x[2], x[3]), ... , f(x[i-2], x[i-1])]
--             For list, x with odd i elements, and operation f, return the list
--             [f(x[0], x[1]), f(x[2], x[3]), ... , x[i-1]]

last_element :: [a] -> a
last_element (x:xs) = last_element xs

remove_last :: [a] -> [a]
remove_last [] = []
remove_last xs = init xs

func_11 :: (Integer -> Integer -> Integer) -> [Integer] -> [Integer]
func_11 f (a0:a1:as) = f a0 a1 : func_11 f (a1:as)
func_11 _ _ = []
-- func_11 f (a0:a1:as) = do
--     if as `mod` 2 != 0 
--         then
--             let e = []
--             let my_elem = last_element (a0:a1:as)
--             let e = remove_last (a0:a1:as)
--     else 
--         --f a0 a1 : func_11 f (a1:as)
--         if myelem != null
--             -- append last odd element to the end
--             then snoc my_elem (a0:a1:as)
--         else
--             f a0 a1 : func_11 f (a1:as)
