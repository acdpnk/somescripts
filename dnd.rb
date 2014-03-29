#!/usr/bin/env ruby

plist = %x{defaults read /Users/chrifpa/Library/Preferences/ByHost/com.apple.notificationcenterui.830BEC0C-A279-5676-BE8A-D93DC48D4955.plist}

if plist.match(/doNotDisturb = 1;/)
    puts 1
else
    puts 0
end
