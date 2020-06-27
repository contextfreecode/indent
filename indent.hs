{-# LANGUAGE
    DuplicateRecordFields, MultiWayIf, NumericUnderscores, OverloadedStrings,
    QuasiQuotes
#-}

-- https://takenobu-hs.github.io/downloads/haskell_ghc_illustrated.pdf

module Main where

import qualified Data.Text.IO as TextIO
import Data.Text (Text)
import NeatInterpolation (text)
import Text.Show.Pretty

data Place = Place {
    placeName :: Text,
    population :: Int
} deriving (Show)

data Categorized = Categorized {
    categorizedName :: Text,
    category :: Text
} deriving (Show)

places = [
    Place {
        placeName = "Nuevo Progreso",
        population = 2_704
    },
    Place {placeName = "San Marcos", population = 47_063},
    Place {placeName = "Xela", population = 180_706}
 ]

main = do
    let categorizedPlaces = map
            (\place ->
                Categorized {
                    categorizedName = placeName place,
                    category =
                        let pop = population place
                        in if
                        | pop < 5_000 -> "village"
                        | pop < 100_000 ->
                            let category = "town"
                            in category
                        | otherwise -> "city"
                }
            )
            places
    putStrLn $ ppShow categorizedPlaces
-- Hi there!
    TextIO.putStrLn yaml
    TextIO.putStrLn yaml2

yaml = "\
    \- name: Nuevo Progreso\n\
    \  population: 2704\n\
    \- name: San Marcos\n\
    \  population: 47063\n\
    \- name: Xela\n\
    \  population: 180706"

yaml2 =
    [text|
        - name: Nuevo Progreso
          population: 2704
        - name: San Marcos
          population: 47063
        - name: Xela
          population: 180706
    |]

-- rm -rf ghc-out && mkdir ghc-out && ghc -ddump-simpl -odir ghc-out -hidir ghc-out indent.hs > ghc-out/stdout.txt && ./indent
-- ghc --make indent.hs -odir ghc-out -hidir ghc-out && ./indent
