module Hooks.EventHook
  ( events
  )
where

-- Imports --------------------------------------------------------------------
import XMonad
import XMonad.Hooks.EwmhDesktops as EWMH
import XMonad.Layout.Fullscreen as FS
import Data.Monoid

-- EventHook --------------------------------------------------------------------
events :: Event -> X All
events = mconcat
  [ FS.fullscreenEventHook
   ,EWMH.fullscreenEventHook
  ]
