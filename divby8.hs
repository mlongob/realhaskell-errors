{-# LANGUAGE FlexibleContexts, DatatypeContexts #-}

module DivBy8 where

import Control.Monad.Error
import Control.Exception

data Show a => DivByError a = DivBy0
                            | OtherDivByError String
                              deriving (Eq, Read, Show)

instance Error (DivByError a) where
    strMsg x = OtherDivByError x

divBy :: Integral a => a -> [a] -> Either (DivByError a) [a]
divBy = divByGeneric

divByGeneric :: (Integral a, MonadError (DivByError a) m) =>
                    a -> [a] -> m [a]
divByGeneric = undefined
