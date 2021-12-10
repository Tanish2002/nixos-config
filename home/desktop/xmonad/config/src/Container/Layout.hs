{-# LANGUAGE MultiParamTypeClasses, TypeSynonymInstances #-}
{-# LANGUAGE FlexibleContexts #-}
module Container.Layout where

-- Imports --------------------------------------------------------------------
import XMonad                  
import Data.Maybe
import Control.Monad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Fullscreen
import XMonad.Layout.SimpleFloat
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Named
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.MultiToggle
import XMonad.Layout.Gaps
import XMonad.Layout.Simplest (Simplest(..))
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.NoBorders
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import XMonad.Layout.BoringWindows
import XMonad.Util.Themes

import XMonad.StackSet               as W


------------------------------------------------------------------------
--
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--

-- Types ------------------------------------------------------------------------
data Gaps' = Gaps'
  { u  :: Integer
  , d  :: Integer
  , r  :: Integer
  , l  :: Integer
  }

-- Functions --------------------------------------------------------------------

gs :: Gaps'
gs = Gaps' { u = 20, d = 20, r = 20, l = 20 }

spacingses :: l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
spacingses = spacingRaw False
             (Border (u gs) 0 (r gs) 0)
             True
             (Border 0 (d gs) 0 (l gs))
             True

outerGaps    = 20
myGaps       = gaps [(U, outerGaps), (R, outerGaps), (L, outerGaps), (D, outerGaps)]
-- customised layouts

full = named "Fullscreen" $ noBorders (fullscreenFull Full)

tall =
  named "Tall"
    . spacingses
    $ ResizableTall 1 (2 / 100) (1 / 2) []

tabs = named "Tabs"
  . myGaps
  $ tabbed shrinkText tabTheme
--  $ tabbed shrinkText (theme smallClean) --tabTheme

bsp =
  named "Binary Partition"
    . spacingses
    $ emptyBSP


float' = named "Float" $ simpleFloat' shrinkText emptyTheme

-- layout --
layout = fullscreenFull
  $ mkToggle (ENABLETABS ?? EOT)
  $ windowNavigation
  $ boringWindows
  $ avoidStruts
  $ (bsp ||| tabs ||| float' ||| tall ||| Mirror tall ||| full)

addNETSupported :: Atom -> X ()
addNETSupported x   = withDisplay $ \dpy -> do
    r               <- asks theRoot
    a_NET_SUPPORTED <- getAtom "_NET_SUPPORTED"
    a               <- getAtom "ATOM"
    liftIO $ do
       sup <- (join . maybeToList) <$> getWindowProperty32 dpy a_NET_SUPPORTED r
       when (fromIntegral x `notElem` sup) $
         changeProperty32 dpy r a_NET_SUPPORTED a propModeAppend [fromIntegral x]

addEWMHFullscreen :: X ()
addEWMHFullscreen   = do
    wms <- getAtom "_NET_WM_STATE"
    wfs <- getAtom "_NET_WM_STATE_FULLSCREEN"
    mapM_ addNETSupported [wms, wfs]

--Tabs Stuff
enableTabs x = addTabs shrinkText (theme smallClean) $ subLayout [] Simplest x
--enableTabs x = addTabs shrinkText tabTheme $ subLayout [] Simplest x
data ENABLETABS = ENABLETABS deriving (Read, Show, Eq, Typeable)
instance Transformer ENABLETABS Window where
     transform ENABLETABS x k = k (enableTabs x) (const x)
tabTheme :: Theme
tabTheme = def { activeColor         = "#090909"
               , activeBorderColor   = "#000000"
               , activeTextColor     = "#F2A5B7"
               , inactiveColor       = "#F2A5B7"
               , inactiveBorderColor = "#000000"
               , inactiveTextColor   = "#090909"
               , urgentColor         = "#090909"
               , urgentBorderColor   = "#000000"
               , urgentTextColor     = "#F2A5B7"
               , fontName            = "FuraMono Nerd Font"
               , decoHeight          = 52
               }

emptyTheme :: Theme
emptyTheme = def { decoHeight = 0, decoWidth = 0 }

