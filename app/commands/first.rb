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
  if parameters[0] ==  "Aatrox"     then  return 266
  if parameters[0] == "Ahri"      then  return  103
    if parameters[0] == "Akali"    then   return  84
    if parameters[0] == "Alistar"  then   return  12
    if parameters[0] == "Amumu"    then   return  32
    if parameters[0] == "Anivia"   then   return  34
    if parameters[0] == "Annie"    then   return  1
    if parameters[0] == "Ashe"     then   return  22
    if parameters[0] == "AurelionSol" then return  136
    if parameters[0] == "Azir"     then   return  268
    if parameters[0] == "Bard"     then   return  432
    if parameters[0] == "Blitzcrank" then return  53
    if parameters[0] == "Brand"     then   return 63
    if parameters[0] =="Braum"      then return  201
  if parameters[0] ==  "Caitlyn"    then return  51
    if parameters[0] =="Camille"  then  return   164
  if parameters[0] ==  "Cassiopeia" then return  69
  if parameters[0] ==  "ChoGath"  then  return   31
  if parameters[0] ==  "Corki"    then  return   42
    if parameters[0] =="Darius"   then  return   122
    if parameters[0] =="Diana"    then   return  131
  if parameters[0] ==  "DrMundo"  then   return  36
    if parameters[0] =="Draven"   then  return   119
    if parameters[0] =="Ekko"         then     return 245
  if parameters[0] ==  "Elise"        then    return  60
    if parameters[0] ==  "Evelynn"    then      return  28
    if parameters[0] ==  "Ezreal"     then     return   81
    if parameters[0] ==  "Fiddlesticks"    then return   9
    if parameters[0] ==  "Fiora"    then   return   114
    if parameters[0] ==  "Fizz"     then   return   105
    if parameters[0] ==  "Galio"    then   return   3
    if parameters[0] ==  "Gangplank" then   return  41
    if parameters[0] ==  "Garen"    then    return  86
    if parameters[0] ==  "Gnar"     then   return   150
    if parameters[0] ==  "Gragas"   then    return  79
    if parameters[0] ==  "Graves"   then     return 104
    if parameters[0] ==  "Hecarim"  then    return  120
    if parameters[0] ==  "Heimerdinger" then  return 74
    if parameters[0] ==  "Illaoi"   then    return  420
    if parameters[0] ==  "Irelia"   then    return  39
    if parameters[0] ==  "Ivern"     then    return  427
    if parameters[0] ==  "Janna"     then     return 40
    if parameters[0] ==  "JarvanIV"  then     return 59
    if parameters[0] ==  "Jax"       then     return 24
    if parameters[0] ==  "Jayce"     then     return 126
    if parameters[0] ==  "Jhin"     then      return 202
    if parameters[0] ==  "Jinx"    then    return    222
    if parameters[0] ==  "Kalista" then    return    429
    if parameters[0] ==  "Karma"   then    return    43
    if parameters[0] ==  "Karthus" then   return     30
    if parameters[0] ==  "Kassadin" then  return     38
    if parameters[0] ==  "Katarina" then  return     55
    if parameters[0] ==  "Kayle"   then   return     10
    if parameters[0] ==  "Kayn"    then   return     141
    if parameters[0] ==  "Kennen"  then    return    85
    if parameters[0] ==  "KhaZix"  then   return     121
    if parameters[0] ==  "Kindred"   then     return 203
    if parameters[0] ==  "Kled"      then     return 240
    if parameters[0] ==  "KogMaw"   then     return  96
    if parameters[0] ==  "LeBlanc"  then    return   7
    if parameters[0] ==  "LeeSin"   then     return  64
    if parameters[0] ==  "Leona"     then    return  89
    if parameters[0] ==  "Lissandra" then     return 127
    if parameters[0] ==  "Lucian"    then     return 236
    if parameters[0] ==  "Lulu"      then     return 117
    if parameters[0] ==  "Lux"       then    return  99
    if parameters[0] ==  "Malphite"  then    return  54
    if parameters[0] ==  "Malzahar"  then    return  90
    if parameters[0] ==  "Maokai"    then    return  57
    if parameters[0] ==  "MasterYi"  then    return  11
    if parameters[0] ==  "MissFortune" then  return  21
    if parameters[0] ==  "Mordekaiser" then  return  82
    if parameters[0] ==  "Morgana"   then    return  25
    if parameters[0] ==  "Nami"      then     return 267
    if parameters[0] ==  "Nasus"     then    return  75
    if parameters[0] ==  "Nautilus"  then     return 111
    if parameters[0] ==  "Nidalee"   then     return 76
    if parameters[0] ==  "Nocturne"  then    return  56
    if parameters[0] ==  "Nunu"      then    return  20
    if parameters[0] ==  "Olaf"      then    return  2
    if parameters[0] ==  "Orianna"   then  return   61
    if parameters[0] ==  "Ornn"      then   return  516
    if parameters[0] ==  "Pantheon"  then    return 80
    if parameters[0] ==  "Poppy"     then   return 78
    if parameters[0] ==  "Quinn"     then  return   133
    if parameters[0] ==  "Rakan"     then  return   497
    if parameters[0] ==  "Rammus"    then  return   33
    if parameters[0] ==  "RekSai"    then   return  421
    if parameters[0] ==  "Renekton"  then  return   58
    if parameters[0] ==  "Rengar"    then   return  107
    if parameters[0] ==  "Riven"     then  return   92
    if parameters[0] ==  "Rumble"    then  return   68
    if parameters[0] ==  "Ryze"      then  return   13
    if parameters[0] ==  "Sejuani"   then   return  113
    if parameters[0] ==  "Shaco"     then  return   35
    if parameters[0] ==  "Shen"      then  return   98
    if parameters[0] ==  "Shyvana"   then    return 102
    if parameters[0] ==  "Singed"    then   return  27
    if parameters[0] ==  "Sion"      then   return  14
    if parameters[0] ==  "Sivir"     then   return  15
    if parameters[0] ==  "Skarner"   then   return  72
    if parameters[0] ==  "Sona"      then   return  37
    if parameters[0] ==  "Soraka"    then   return  16
    if parameters[0] ==  "Swain"     then   return  50
    if parameters[0] ==  "Syndra"    then    return 134
    if parameters[0] ==  "TahmKench" then    return 223
    if parameters[0] ==  "Taliyah"     then   return 163
    if parameters[0] ==  "Talon"       then  return  91
    if parameters[0] ==  "Taric"       then  return  44
    if parameters[0] ==  "Teemo"       then  return  17
    if parameters[0] ==  "Thresh"      then   return 412
    if parameters[0] ==  "Tristana"    then  return  18
    if parameters[0] ==  "Trundle"     then  return  48
    if parameters[0] ==  "Tryndamere"  then  return  23
    if parameters[0] ==  "TwistedFate" then return   4
    if parameters[0] ==  "Twitch"      then  return  29
    if parameters[0] ==  "Udyr"        then   return  77
    if parameters[0] ==    "Urgot"     then   return   6
    if parameters[0] ==    "Varus"     then     return 110
    if parameters[0] ==    "Vayne"    then    return  67
    if parameters[0] ==    "Veigar"   then    return  45
    if parameters[0] ==    "VelKoz"   then     return 161
    if parameters[0] ==    "Vi"       then     return 254
    if parameters[0] ==    "Viktor"   then     return 112
    if parameters[0] ==    "Vladimir" then   return   8
    if parameters[0] ==    "Volibear" then     return 106
    if parameters[0] ==    "Warwick"  then  return   19
    if parameters[0] ==    "Wukong"   then  return   62
    if parameters[0] ==    "Xayah"    then   return  498
    if parameters[0] ==    "Xerath"   then   return  101
    if parameters[0] ==    "XinZhao"  then return    5
    if parameters[0] ==    "Yasuo"    then   return  157
    if parameters[0] ==    "Yorick"   then  return   83
    if parameters[0] ==    "Zac"      then   return  154
    if parameters[0] ==    "Zed"      then   return  238
    if parameters[0] ==    "Ziggs"    then   return  115
    if parameters[0] ==    "Zilean"   then  return   26
    if parameters[0] ==    "Zoe"      then  return  142
    if parameters[0] ==    "Zyra"     then  return    143
   }
  end
