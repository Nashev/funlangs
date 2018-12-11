#!/usr/bin/env stack
-- stack --resolver=lts-12.22 script
{-# OPTIONS
    -Wall -Wcompat -Werror
    -Wincomplete-record-updates -Wincomplete-uni-patterns
    -Wredundant-constraints #-}
{-# LANGUAGE LambdaCase       #-}
{-# LANGUAGE OverloadedLists  #-}
{-# LANGUAGE ParallelListComp #-}

import           Data.Char (isUpper)
import           Data.List (sortOn)
import           Data.Map  (Map, (!?))
import           Data.Ord  (Down (Down))
import           Util      (fst3)

languages :: LanguageDesc
languages =
    [ "C" -:
        [ AdHocPolymorphism                     -: No
        , AlgebraicDataTypes                    -: No
        , Closures                              -: No
        , DependentTypes                        -: No
        , DownwardsFunargProblem                -: Yes
        , ForcesImmutability                    -: No
        , ImmutableData                         -: No
        , Laziness                              -: No
        , ParametricModules                     -: No
        , PureFunctions                         -: No
        , UpwardsFunargProblem                  -: No
        ]
    , "C++" -:
        [ AdHocPolymorphism                     -: Yes
        , AlgebraicDataTypes                    -: No
        , Closures                              -: Yes
        , DependentTypes                        -: No
        , DownwardsFunargProblem                -: Yes
        , ForcesImmutability                    -: No
        , ImmutableData                         -: Yes
        , Laziness                              -: No
        , ParametricModules                     -: No
        , ParametricPolymorphism                -: Yes
        , PatternMatching                       -: Yes
        , PureFunctions                         -: Quirks
        , UpwardsFunargProblem                  -: Quirks
        ]
    , "Haskell" -:
        [ AdHocPolymorphism                     -: Yes
        , AlgebraicDataTypes                    -: Yes
        , Closures                              -: Yes
        , DependentTypes                        -: No
        , DownwardsFunargProblem                -: Yes
        , ForcesImmutability                    -: Yes
        , ImmutableData                         -: Yes
        , Laziness                              -: Yes
        , ParametricModules                     -: Quirks
        , ParametricPolymorphism                -: Yes
        , PatternMatching                       -: Yes
        , PatternMatchingAlternatives           -: Yes
        , PatternMatchingVariableIntroduction   -: Yes
        , PureFunctions                         -: Yes
        , TailCallOptimization                  -: Yes
        , UpwardsFunargProblem                  -: Yes
        ]
    , "Idris" -:
        [ AlgebraicDataTypes                    -: Yes
        , Closures                              -: Yes
        , DependentTypes                        -: Yes
        , DownwardsFunargProblem                -: Yes
        , ForcesImmutability                    -: Yes
        , ImmutableData                         -: No
        , UpwardsFunargProblem                  -: Yes
        ]
    , "OCaml" -:
        [ AdHocPolymorphism                     -: Yes
        , AlgebraicDataTypes                    -: Yes
        , Closures                              -: Yes
        , DependentTypes                        -: No
        , DownwardsFunargProblem                -: Yes
        , ForcesImmutability                    -: Yes
        , ImmutableData                         -: Yes
        , Laziness                              -: Yes
        , ParametricPolymorphism                -: Yes
        , PureFunctions                         -: No
        , UpwardsFunargProblem                  -: Yes
        ]
    , "Python" -:
        [ AdHocPolymorphism                     -: Yes
        , AlgebraicDataTypes                    -: No
        , Closures                              -: Yes
        , DependentTypes                        -: No
        , DownwardsFunargProblem                -: Yes
        , ForcesImmutability                    -: No
        , ImmutableData                         -: Yes
        , Laziness                              -: No
        , ParametricModules                     -: No
        , ParametricPolymorphism                -: Yes
        , PatternMatching                       -: Yes
        , PatternMatchingVariableIntroduction   -: Yes
        , PureFunctions                         -: No
        , UpwardsFunargProblem                  -: Yes
        ]
    , "Rust" -:
        [ AdHocPolymorphism                     -: Yes
        , AlgebraicDataTypes                    -: Yes
        , Closures                              -: Quirks
        , DependentTypes                        -: No
        , DownwardsFunargProblem                -: Yes
        , ForcesImmutability                    -: Yes
        , ImmutableData                         -: Yes
        , Laziness                              -: No
        , ParametricModules                     -: No
        , ParametricPolymorphism                -: Yes
        , PatternMatching                       -: Quirks
        , PatternMatchingAlternatives           -: Yes
        , PatternMatchingVariableIntroduction   -: Yes
        , PureFunctions                         -: No
        , UpwardsFunargProblem                  -: Yes
        ]
    ]

type LanguageDesc = [(String, Map Feature Value)]

data Feature
    = AdHocPolymorphism
    | AlgebraicDataTypes
    | Closures
    | DependentTypes
    | DownwardsFunargProblem
    | ForcesImmutability
    | ImmutableData
    | Laziness
    | ParametricModules
    | ParametricPolymorphism
    | PatternMatching
    | PatternMatchingAlternatives
    | PatternMatchingVariableIntroduction
    | PolymorphicRecursion
    | PureFunctions
    | ReferentialTransparency
    | TailCallOptimization
    | UpwardsFunargProblem
    deriving (Bounded, Enum, Eq, Ord, Show)

data Value = No | Quirks | Yes

features :: [Feature]
features = [minBound ..]

main :: IO ()
main = putStrLn . unlines
    $   "# Functional languages"
    :   ""
    :   "There is no such thing as a functional language."
    :   "There are only languages with different functional features."
    :   ""
    :   [ unwords
            $ "|" : "Language" : "|" : "Overall rating" : "|"
            : concat
                [ [show n ++ '.' : showAbbr feature, "|"]
                | n <- [1 :: Int ..]
                | feature <- features
                ]
        , "|---|---|" ++ concat (replicate (length features) "---|")
        ]
    ++  [ unwords
            $ "|" : language : "|" : show (realToFrac rating :: Float) : "|"
            : do
                f <- features
                [   case languageFeatures !? f of
                        Nothing     -> ""
                        Just No     -> ":x:"
                        Just Quirks -> ":warning:"
                        Just Yes    -> ":heavy_check_mark:"
                    , "|"
                    ]
        | (rating, language, languageFeatures) <- languages'
        ]
    ++  ""
    :   [ show n ++ ". " ++ showAbbr feature ++ ": " ++ show feature
        | n <- [1 :: Int ..]
        | feature <- features
        ]
  where
    languages' = sortOn (Down . fst3)
        [ (rating, language, languageFeatures)
        | (language, languageFeatures) <- languages
        , let rating = sum $ value <$> languageFeatures
        ]

showAbbr :: Show a => a -> String
showAbbr = filter isUpper . show

value :: Value -> Rational
value = \case
    No     -> 0
    Quirks -> 1/2
    Yes    -> 1

(-:) :: a -> b -> (a, b)
(-:) = (,)
