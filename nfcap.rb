#!/usr/bin/ruby

plist = %x{df -h /Volumes/Nifty}
ALPHABET = %w{ a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y }
unless plist.match(/\/dev\/disk/)
    print ' '
    exit
end
if plist.match(/\/dev\/disk/)
    raw_percent = plist.match(/\s+(100|\d{1,2})\%/)
    if raw_percent.nil?
        print ' '
        exit
    end
    unless raw_percent[1].nil?
        percent = ((raw_percent[1].to_f) / 2).to_i
        print ALPHABET[percent]
        #puts percent
    end
end


#!/usr/bin/ruby
#
#plist = %x{tmutil status}
#ALPHABET = %w{ a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y }
#if plist.match(/Running = 1;/)
#    raw_percent = plist.match(/\s+Percent = "?(\d(?:\.\d+)?)"?;/)
#    unless raw_percent[1].nil?
#        percent = ((raw_percent[1].to_f * 100) / 2).to_i
#        print ALPHABET[percent]
#    end
#end
