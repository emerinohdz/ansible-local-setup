tell application "System Events"
    tell application "Mission Control" to launch
    tell group 2 of group 1 of group 1 of process "Dock"
        tell list 1
            set countSpaces to count of buttons
        end tell
        set totalSpaces to 8
        set newSpaces to totalSpaces - countSpaces
        repeat newSpaces times
            click (every button whose value of attribute "AXDescription" is "add desktop")
        end repeat
    end tell
    delay 0.5
    tell application "System Events"
        key code 53
    end tell
end tell
