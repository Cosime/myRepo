module First
  include GroupmeBotHelper

  FIRST_COMMANDS = [:First, :add]

  def first(parameters = nil)
    return send_message(@bot.bot_id, "Try '+first commands' for more options") unless parameters
    case parameters[0]
    when 'commands'
      message = "Commands: \n+" + LIBRARYNAME_COMMANDS[1..(LIBRARYNAME_COMMANDS.count-1)].join("\n+")
      send_message(@bot.bot_id, message)
    end
  end

  def add(parameters = [2,2])
    total = parameters[0].to_i + parameters[1].to_i
    send_message(@bot.bot_id, "Total : #{total}")
  end

end
