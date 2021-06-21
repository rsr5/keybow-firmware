require "keybow"

paste = false

function setup()
  keybow.auto_lights(false)
  keybow.clear_lights()
  keybow.set_pixel(0, 0, 255, 0)

  keybow.set_pixel(1, 0, 0, 255)
  keybow.set_pixel(2, 2, 0, 255)
  keybow.set_pixel(3, 2, 0, 255)
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


function handle_key_01(pressed)
  if pressed then
    keybow.set_modifier(keybow.LEFT_ALT, true)
    keybow.tap_key(keybow.F2, pressed)
    keybow.set_modifier(keybow.LEFT_ALT, false)
    keybow.usleep(500000)
    keybow.text("/usr/local/bin/st -e /bin/tmux")
    keybow.tap_key(keybow.ENTER, pressed)
  end
end


function handle_key_02(pressed)
  if pressed then
    keybow.set_modifier(keybow.LEFT_ALT, true)
    keybow.tap_key(keybow.F2, pressed)
    keybow.set_modifier(keybow.LEFT_ALT, false)
    keybow.usleep(500000)
    keybow.text("/home/robin/code/Dockerfiles/bin/otmux")
    keybow.tap_key(keybow.ENTER, pressed)
  end
end

function handle_key_03(pressed)
  if pressed then
    keybow.set_modifier(keybow.LEFT_ALT, true)
    keybow.tap_key(keybow.F2, pressed)
    keybow.set_modifier(keybow.LEFT_ALT, false)
    keybow.usleep(500000)
    keybow.text("/home/robin/code/Dockerfiles/bin/ofirefox")
    keybow.tap_key(keybow.ENTER, pressed)
  end
end
