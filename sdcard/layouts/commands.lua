require "keybow"

paste = false

function setup()
  keybow.auto_lights(false)
  keybow.clear_lights()

  keybow.set_pixel(0, 121, 171, 96) -- Colour the vim paste key
  keybow.set_pixel(9, 0, 43, 54) -- Colour the open terminal key
  keybow.set_pixel(10, 0, 43, 54) -- Colour the open work terminal key
  keybow.set_pixel(11, 247, 75, 53) -- Colour the open work firefox key
end

function handle_key_00(pressed)
  if pressed then
    if paste == false then
      keybow.text("jk", pressed)
      keybow.text(":set paste", pressed)
      keybow.tap_key(keybow.ENTER, pressed)
      keybow.tap_key("i", pressed)
      keybow.set_pixel(0, 255, 0, 0)
      paste = true
    else 
      keybow.tap_key(keybow.ESC, pressed)
      keybow.text(":set nopaste", pressed)
      keybow.tap_key(keybow.ENTER, pressed)
      keybow.tap_key("i", pressed)
      keybow.set_pixel(0, 0, 255, 0)
      paste = false
    end
  end
end

-- Cause the keybow to open the Gnome 3 run command dialogue and execute the command
function run_command(pressed, command)
  if pressed then
    keybow.set_modifier(keybow.LEFT_ALT, true)
    keybow.tap_key(keybow.F2, pressed)
    keybow.set_modifier(keybow.LEFT_ALT, false)
    keybow.usleep(500000)
    keybow.text(command)
    keybow.tap_key(keybow.ENTER, pressed)
  end
end

-- Open a standard tmux session when the 9 key is pressed
function handle_key_09(pressed)
  run_command(pressed, "/usr/local/bin/st -e /bin/tmux")
end

-- Open a work tmux session when the 10 key is pressed
function handle_key_10(pressed)
  run_command(pressed, "/home/robin/code/Dockerfiles/bin/otmux")
end

-- Open a work firefox when the 11 key is pressed
function handle_key_11(pressed)
  run_command(pressed, "/home/robin/code/Dockerfiles/bin/ofirefox")
end
