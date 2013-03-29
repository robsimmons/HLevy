module Demo where

import qualified Syntax
import IL
import Exec

mkv :: String -> Syntax.Name
mkv x = Syntax.Name { Syntax.unName = x }

env1 :: VEnv
env1 = [ (mkv "x", RTag "Leaf" (RTag "8" RUnit)) ]

e1 :: TopLevelCmd
e1 = TopCmd
  (Case (Var (mkv "x")) 
     [ (PTag "Leaf" (PTag "9" PUnit), Return Unit),
       (PTag "Leaf" (PVar (mkv "y")), Return Unit),
       (PTag "Node" (PPair (PVar (mkv "y")) (PVar (mkv "z"))), Return Unit) ],
   V (VUnit))