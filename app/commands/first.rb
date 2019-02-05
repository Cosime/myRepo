
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
    champion = parameters[0]


    uri = URI("https://api.champion.gg/v2/champions?champData=winRate&api_key=034ec73065048e9f9b91a98762c25494")
    data = JSON.parse(Net::HTTP.get(uri))

    champID = findchamp(parameters[0])
    a = data.select { |x| x['_id']['championId'] == champID}
    winrate = a.first['winRate']

    return send_message(@bot.bot_id, parameters[0] + " " + winrate)

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
  def findchamp(championName)
  champs = JSON.parse(File.read('championlist.json'))
  p champs
  selected = champs.select { |x| x["name"].downcase == championName}
  p selected
  selected.first["id"]
  end
