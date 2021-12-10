module Hooks.LogHook
  ( logger
  )
where

-- Imports --------------------------------------------------------------------
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Scratchpad
import XMonad.Util.WorkspaceCompare (getSortByTag)
import XMonad.Hooks.EwmhDesktops
import qualified XMonad.StackSet as W
import qualified System.IO
-- Supporting functions --------------------------------------------------------
mkLayoutStr :: String -> String -> String -> String
mkLayoutStr colour logo rep =
  concat ["%{T2}%{F", colour, "} ", logo, "%{T-}%{F", "#f55966", "} ", rep]

layoutParse :: String -> String
layoutParse name = case words name of
  ("Tabbed":rest) -> layoutParseName (unwords rest) ++ "+"
  _ -> layoutParseName name

layoutParseName :: String -> String
layoutParseName s | s == "Float"                   = mkLayoutStr "#b789cd" "+++ " "FLT "
                  | s == "Binary Partition"        = mkLayoutStr "#b789cd" "||+ " "BSP "
                  | s == "Tall"                    = mkLayoutStr "#b789cd" "||| " "Tall"
                  | s == "Tabs"                    = mkLayoutStr "#b789cd" "___ " "Tab "
                  | s == "Mirror Tall"             = mkLayoutStr "#b789cd" "||| " "MTall"
                  | s == "Fullscreen"              = mkLayoutStr "#b789cd" "| | " "Full"

                  | otherwise                      = s -- fallback for changes in C.Layout
-- LogHook --------------------------------------------------------------------
logger :: X ()
logger = layoutLogHook <+> ewmhDesktopsLogHookCustom scratchpadFilterOutWorkspace

layoutLogHook :: X ()
layoutLogHook = withWindowSet $ \ws -> do
  let layoutName = layoutParse . description . W.layout . W.workspace $ W.current ws
  io $ System.IO.appendFile ("/tmp/xmonad-layout-name") (layoutName ++ "\n")
