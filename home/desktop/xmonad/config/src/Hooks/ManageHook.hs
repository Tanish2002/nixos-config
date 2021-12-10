module Hooks.ManageHook
  ( manager
  )
where

-- Imports --------------------------------------------------------------------
import           XMonad

import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Fullscreen
import Apps.Scratchpad

-- ManageHook --------------------------------------------------------------------
manager :: ManageHook
manager = composeAll
    [ className =? "MPlayer"        --> doFloat
    -- , className =? "mpv"            --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    , className =? "discord"        --> doShift "\xfb6e"
    , className =? "Firefox"        --> doShift "\xf269"
    , isFullscreen --> doFullFloat
    , fullscreenManageHook
    , insertPosition Below Newer]
    <+> manageScratchpad
