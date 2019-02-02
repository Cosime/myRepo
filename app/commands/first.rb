module First
  include GroupmeBotHelper

  FIRST_COMMANDS = [:first, :add, :jadpet]

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

    send_message(@bot.bot_id, "You killed jad #{attempt} times. (while on task)\n")
    totalpets = 0
    attempt.times do |i|
      x = rand(100)
      y = rand(200)
      if (x == 50 && y != 100)
         send_message(@bot.bot_id, "You got pet on kill #{i+1}!")
         totalpets += 1
      end
      if (y == 100 && x != 50)
         send_message(@bot.bot_id, "You turned in you cape for pet after kill #{i+1}!")
         totalpets += 1
      end
      if (x == 50 && y == 100)
         send_message(@bot.bot_id, "You got pet, and turned in your cape for pet on kill #{i+1}!")
         totalpets += 2
      end
    end
     send_message(@bot.bot_id, "You got #{totalpets} pets!")
    if (totalpets == 0)
      send_message(@bot.bot_id, ":(")
    end
  end

end
