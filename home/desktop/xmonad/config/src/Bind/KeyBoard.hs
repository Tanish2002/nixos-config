module Bind.KeyBoard
  ( keyboard
  )
where

-- Imports --------------------------------------------------------------------
import XMonad
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageDocks
import System.Exit
import XMonad.Util.Scratchpad
import Config.Options
import Apps.Alias
import Container.Layout
import XMonad.Layout.SubLayouts
import XMonad.Layout.MultiToggle
import XMonad.Prompt
import XMonad.Prompt.Theme
import qualified XMonad.Actions.Search         as S
-- Bindings --------------------------------------------------------------------

keyboard :: [(String, X ())]
keyboard = concat [ customBindings, wmBindings, multimediaBindings] --, workspaceBindings ]
  where
    customBindings :: [(String, X ())]
    customBindings =
      [
        -- launch terminal
        ("M-<Return>", spawn (term options))
        -- launch dmenu
      , ("M-d", spawn "rofi -show drun")
      , ("M-S-d", spawn "rofi -show run")
    
        -- launch rofi-emoji
      , ("M-e", spawn "$HOME/bin/rofi-emoji")
      
        -- launch rofi-mpvtube
      , ("M-m", spawn "$HOME/bin/rofi_mpvtube")
    
        -- launch rofi-clip
      , ("M-c", spawn "$HOME/bin/rofi-clip")
      
      , ("M-q", themePrompt def)
 
      ]

    wmBindings :: [(String, X())]
    wmBindings =
      [
        -- close focused window
          ("M-S-q", kill)
        
        -- Rotate through the available layout algorithms
        , ("M-<Space>", sendMessage NextLayout)

        --  Reset the layouts on the current workspace to default
        -- , ("M-S-<Space>", setLayout $ XMonad.layoutHook conf)

        -- Resize viewed windows to the correct size
        , ("M-n", refresh)

        -- Move focus to the next window
        , ("M-<Tab>", windows W.focusDown)

        -- Move focus to the next window
        , ("M-j", windows W.focusDown)
        , ("M-<Down>", windows W.focusDown)
        
        -- Move focus to the previous window
        , ("M-k", windows W.focusUp  )
        , ("M-<Up>", windows W.focusUp  )

        -- Move focus to the master window
        , ("M-S-m", windows W.focusMaster  )

        -- Swap the focused window and the master window
        , ("M-S-<Return>", windows W.swapMaster )

        -- Swap the focused window with the next window
        , ("M-S-j", windows W.swapDown )
        , ("M-S-<Down>", windows W.swapDown  )

        -- Swap the focused window with the previous window
        , ("M-S-k", windows W.swapUp    )
        , ("M-S-<Up>", windows W.swapUp    )

        -- Tabbed Layout Control
        , ("M1-t",            sendMessage $ Toggle ENABLETABS)

        , ("M1-S-<Left>",     sendMessage $ pullGroup L)
        , ("M1-S-<Down>",     sendMessage $ pullGroup D)
        , ("M1-S-<Up>",       sendMessage $ pullGroup U)
        , ("M1-S-<Right>",    sendMessage $ pullGroup R)

        , ("M1-m",            withFocused (sendMessage . MergeAll))
        , ("M1-u",            withFocused (sendMessage . UnMerge))

        -- Shrink the master area
        , ("M-h", sendMessage Shrink)
        , ("M-<Left>", sendMessage Shrink)

        -- Expand the master area
        , ("M-l", sendMessage Expand)
        , ("M-<Right>", sendMessage Expand)

        -- Push window back into tiling
        , ("M-t", withFocused $ windows . W.sink)
        
        -- Increment the number of windows in the master area
        , ("M-,", sendMessage (IncMasterN 1))

        -- Deincrement the number of windows in the master area
        , ("M-.", sendMessage (IncMasterN (-1)))

        -- Toggle the status bar gap
        -- Use this binding with avoidStruts from Hooks.ManageDocks.
        -- See also the statusBar function from Hooks.DynamicLog.
        --
        , ("M-b", do sendMessage ToggleStruts
                     spawn "polybar-msg cmd toggle")

        -- Quit xmonad
        , ("M-S-<Escape>", spawn "pm")

        -- Restart xmonad
        , ("M-S-r", spawn "xmonad --restart")

        -- Spawn Scratchpad
        , ("M-`", scratchpadSpawnActionCustom scratch)
 
        ]

      ++ [ ("M-\\ " ++ k, S.promptSearch promptConfig f)
         | (k, f) <- searchList
         ]
      
      ++
      
      [("M" ++ m ++ ('-':k:[]) , windows $ f i)
      | (i, k) <- zip (spaces options) ['1'..'9']
      , (f, m) <- [(W.view, ""), (W.shift, "-S")]]

    multimediaBindings :: [(String, X())]
    multimediaBindings =
      [
          ("<XF86AudioPlay>", spawn "$HOME/bin/mpvctl -t")
        , ("<XF86AudioPrev>", spawn "pkill skroll ; $HOME/bin/mpvctl -p")
        , ("<XF86AudioNext>", spawn "pkill skroll ; $HOME/bin/mpvctl -n")
        , ("<XF86AudioMute>",   spawn "amixer set Master toggle")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%-")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+")
        , ("<XF86MonBrightnessUp>", spawn "light -A 10")
        , ("<XF86MonBrightnessDown>", spawn "light -U 10")
        , ("<Print>", spawn "$HOME/bin/screenshot-menu.sh")
        ]

-- search engine submap
searchList :: [(String, S.SearchEngine)]
searchList = [("g", S.duckduckgo), ("d", S.dictionary), ("w", S.wikipedia), ("y", S.youtube)]
