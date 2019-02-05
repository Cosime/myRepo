module First
  include GroupmeBotHelper

  FIRST_COMMANDS = [:first, :add, :jadpet, :chessboard, :lolwinrate]

  def first(parameters = nil)
    return send_message(@bot.bot_id, "Try '+first commands' for more options") unless parameters
    case parameters[0]
    when 'commands'
      message = "Commands: \n+" + LIBRARYNAME_COMMANDS[1..(LIBRARYNAME_COMMANDS.count-1)].join("\n+")
      send_message(@bot.bot_id, message)
    end
  end

  def add(parameters = nil)
    return send_message(@bot.bot_id, "Default 2+2 : #{2+2}") unless parameters
    print parameters
    total = parameters[0].to_i + parameters[1].to_i
    send_message(@bot.bot_id, "Total : #{total}")
  end

  def jadpet(parameters = nil)
    begin
      attempt = parameters[0].to_i
    rescue
      attempt = 1
      end
    output = ""

    totalpets = 0
    attempt.times do |i|
      x = rand(100)
      y = rand(200)
      if (x == 50 && y != 100)
         output += "You got pet on kill #{i+1}!\n"
         totalpets += 1
      end
      if (y == 100 && x != 50)
        output += "You turned in you cape for pet after kill #{i+1}!\n"
        totalpets += 1
      end
      if (x == 50 && y == 100)
        output += "You got pet, and turned in your cape for pet on kill #{i+1}!\n"
        totalpets += 2
      end
    end
      output =  "You killed jad #{attempt} times. (while on task)\nYou got #{totalpets} pets!\n" + output
      return send_message(@bot.bot_id, output) unless (totalpets == 0)
      send_message(@bot.bot_id, "You killed jad #{attempt} times. (while on task)\nYou didn't get any pets :(")
  end

  def lolwinrate(parameters = nil)
    return send_message(@bot.bot_id, "Please input a champion") unless parameters
    champion = params[:text].downcase.split(' ')
    champion.delete_at(0)

    require('JSON')
    require('net/http')
    uri = URI("https://api.champion.gg/v2/champions?champData=winRate&api_key=034ec73065048e9f9b91a98762c25494")
    data = JSON.parse(Net::HTTP.get(uri))

    champ = findchamp(parameters[0])
    a = data.select { |x| x['_id']['championId'] == champ}

    temp = a.first['winRate']

    return send_message(@bot.bot_id, parameters[0] + " " + temp)

  end

  def chessboard(parameters = nil)
    output = ""
    output += "♜ | ♞ | ♝ | ♛ | ♚ | ♝ | ♞ | ♜\n----------------------------------\n"
    output += "♟ | ♟ | ♟ | ♟ | ♟ | ♟ | ♟ | ♟\n----------------------------------\n"
    output += "@ | @ | @ | @ | @ | @ | @ | @\n----------------------------------\n"
    output += "@ | @ | @ | @ | @ | @ | @ | @\n----------------------------------\n"
    output += "@ | @ | @ | @ | @ | @ | @ | @\n----------------------------------\n"
    output += "@ | @ | @ | @ | @ | @ | @ | @\n----------------------------------\n"
    output += "♙ | ♙ | ♙ | ♙ | ♙ | ♙ | ♙ | ♙\n----------------------------------\n"
    output += "♖ | ♘ | ♗ | ♕ | ♔ | ♗ | ♘ | ♖\n"
    send_message(@bot.bot_id, output)
  end
end

private
  def findchamp(parameters = nil)
  if parameters[0] ==  "Aatrox"       return 266
  if parameters[0] == "Ahri"        return  103
    if parameters[0] == "Akali"       return  84
    if parameters[0] == "Alistar"     return  12
    if parameters[0] == "Amumu"       return  32
    if parameters[0] == "Anivia"      return  34
    if parameters[0] == "Annie"       return  1
    if parameters[0] == "Ashe"        return  22
    if parameters[0] == "AurelionSol" return  136
    if parameters[0] == "Azir"        return  268
    if parameters[0] == "Bard"        return  432
    if parameters[0] == "Blitzcrank"  return  53
    if parameters[0] == "Brand"        return 63
    if parameters[0] =="Braum"       return  201
  if parameters[0] ==  "Caitlyn"     return  51
    if parameters[0] =="Camille"    return   164
  if parameters[0] ==  "Cassiopeia"  return  69
  if parameters[0] ==  "ChoGath"    return   31
  if parameters[0] ==  "Corki"      return   42
    if parameters[0] =="Darius"     return   122
    if parameters[0] =="Diana"       return  131
  if parameters[0] ==  "DrMundo"     return  36
    if parameters[0] =="Draven"     return   119
    if parameters[0] =="Ekko"          return 245
  if parameters[0] ==  "Elise"        return  60
    if parameters[0] ==  "Evelynn"      return  28
    if parameters[0] ==  "Ezreal"      return   81
    if parameters[0] ==  "Fiddlesticks"return   9
    if parameters[0] ==  "Fiora"       return   114
    if parameters[0] ==  "Fizz"        return   105
    if parameters[0] ==  "Galio"       return   3
    if parameters[0] ==  "Gangplank"    return  41
    if parameters[0] ==  "Garen"        return  86
    if parameters[0] ==  "Gnar"        return   150
    if parameters[0] ==  "Gragas"       return  79
    if parameters[0] ==  "Graves"        return 104
    if parameters[0] ==  "Hecarim"      return  120
    if parameters[0] ==  "Heimerdinger"  return 74
    if parameters[0] ==  "Illaoi"       return  420
    if parameters[0] ==  "Irelia"       return  39
    if parameters[0] ==  "Ivern"        return  427
    if parameters[0] ==  "Janna"         return 40
    if parameters[0] ==  "JarvanIV"      return 59
    if parameters[0] ==  "Jax"           return 24
    if parameters[0] ==  "Jayce"         return 126
    if parameters[0] ==  "Jhin"          return 202
    if parameters[0] ==  "Jinx"       return    222
    if parameters[0] ==  "Kalista"    return    429
    if parameters[0] ==  "Karma"      return    43
    if parameters[0] ==  "Karthus"   return     30
    if parameters[0] ==  "Kassadin"  return     38
    if parameters[0] ==  "Katarina"  return     55
    if parameters[0] ==  "Kayle"     return     10
    if parameters[0] ==  "Kayn"      return     141
    if parameters[0] ==  "Kennen"     return    85
    if parameters[0] ==  "KhaZix"    return     121
    if parameters[0] ==  "Kindred"       return 203
    if parameters[0] ==  "Kled"          return 240
    if parameters[0] ==  "KogMaw"       return  96
    if parameters[0] ==  "LeBlanc"     return   7
    if parameters[0] ==  "LeeSin"       return  64
    if parameters[0] ==  "Leona"        return  89
    if parameters[0] ==  "Lissandra"     return 127
    if parameters[0] ==  "Lucian"        return 236
    if parameters[0] ==  "Lulu"          return 117
    if parameters[0] ==  "Lux"          return  99
    if parameters[0] ==  "Malphite"     return  54
    if parameters[0] ==  "Malzahar"     return  90
    if parameters[0] ==  "Maokai"       return  57
    if parameters[0] ==  "MasterYi"     return  11
    if parameters[0] ==  "MissFortune"  return  21
    if parameters[0] ==  "Mordekaiser"  return  82
    if parameters[0] ==  "Morgana"      return  25
    if parameters[0] ==  "Nami"          return 267
    if parameters[0] ==  "Nasus"        return  75
    if parameters[0] ==  "Nautilus"      return 111
    if parameters[0] ==  "Nidalee"       return 76
    if parameters[0] ==  "Nocturne"     return  56
    if parameters[0] ==  "Nunu"         return  20
    if parameters[0] ==  "Olaf"         return  2
    if parameters[0] ==  "Orianna"     return   61
    if parameters[0] ==  "Ornn"         return  516
    if parameters[0] ==  "Pantheon"      return 80
    if parameters[0] ==  "Poppy"        return 78
    if parameters[0] ==  "Quinn"       return   133
    if parameters[0] ==  "Rakan"       return   497
    if parameters[0] ==  "Rammus"      return   33
    if parameters[0] ==  "RekSai"       return  421
    if parameters[0] ==  "Renekton"    return   58
    if parameters[0] ==  "Rengar"       return  107
    if parameters[0] ==  "Riven"       return   92
    if parameters[0] ==  "Rumble"      return   68
    if parameters[0] ==  "Ryze"        return   13
    if parameters[0] ==  "Sejuani"      return  113
    if parameters[0] ==  "Shaco"       return   35
    if parameters[0] ==  "Shen"        return   98
    if parameters[0] ==  "Shyvana"       return 102
    if parameters[0] ==  "Singed"       return  27
    if parameters[0] ==  "Sion"         return  14
    if parameters[0] ==  "Sivir"        return  15
    if parameters[0] ==  "Skarner"      return  72
    if parameters[0] ==  "Sona"         return  37
    if parameters[0] ==  "Soraka"       return  16
    if parameters[0] ==  "Swain"        return  50
    if parameters[0] ==  "Syndra"        return 134
    if parameters[0] ==  "TahmKench"     return 223
    if parameters[0] ==  "Taliyah"       return 163
    if parameters[0] ==  "Talon"        return  91
    if parameters[0] ==  "Taric"        return  44
    if parameters[0] ==  "Teemo"        return  17
    if parameters[0] ==  "Thresh"        return 412
    if parameters[0] ==  "Tristana"     return  18
    if parameters[0] ==  "Trundle"      return  48
    if parameters[0] ==  "Tryndamere"   return  23
    if parameters[0] ==  "TwistedFate" return   4
    if parameters[0] ==  "Twitch"       return  29
    if parameters[0] ==  "Udyr"          return  77
    if parameters[0] ==    "Urgot"       return   6
    if parameters[0] ==    "Varus"         return 110
    if parameters[0] ==    "Vayne"        return  67
    if parameters[0] ==    "Veigar"       return  45
    if parameters[0] ==    "VelKoz"        return 161
    if parameters[0] ==    "Vi"            return 254
    if parameters[0] ==    "Viktor"        return 112
    if parameters[0] ==    "Vladimir"    return   8
    if parameters[0] ==    "Volibear"      return 106
    if parameters[0] ==    "Warwick"    return   19
    if parameters[0] ==    "Wukong"     return   62
    if parameters[0] ==    "Xayah"       return  498
    if parameters[0] ==    "Xerath"      return  101
    if parameters[0] ==    "XinZhao"   return    5
    if parameters[0] ==    "Yasuo"       return  157
    if parameters[0] ==    "Yorick"     return   83
    if parameters[0] ==    "Zac"         return  154
    if parameters[0] ==    "Zed"         return  238
    if parameters[0] ==    "Ziggs"       return  115
    if parameters[0] ==    "Zilean"     return   26
    if parameters[0] ==    "Zoe"        return  142
    if parameters[0] ==    "Zyra"       return    143
   }
  end
