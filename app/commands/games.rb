module Games
  include GroupmeBotHelper

  GAMES_COMMANDS = [:games, :start_tic_tac_toe, :play_tic_tac_toe]

  def games(parameters = nil)
    case parameters[0]
    when 'commands'
      message = "Commands: \n/" + GAMES_COMMANDS[1..(GAMES_COMMANDS.count-1)].join("\n/")
      send_message(@bot.bot_id, message)
    end
  end

  def start_tic_tac_toe(parameters = nil)
    board = "*|*|*\n*|*|*\n*|*|*\n"
    message = "/play_tic_tac_toe X\n" + board
    send_message(@bot.bot_id, message)
  end

  def play_tic_tac_toe(parameters = nil)
    sleep(1)
    if (parameters.count == 0 || ['X', 'O'].include?(parameters[0]))
      return send_message(@bot.bot_id, "Invalid request. Required 'X' or 'O' not found")
    end

    board = parse_tic_tac_toe_board(parameters[1..(parameters.count-1)])
    return send_message(@bot.bot_id, "You win") if check_victory(board)

    message = "/play_tic_tac_toe "
    move_type = parameters[0].upcase
    if (move_type == 'X')
      message += "O\n"
    else
      message += "X\n"
    end

    board = make_move(board, move_type)

    message += build_board_from_array(board)
    send_message(@bot.bot_id, message)
  end

  private
  def make_move(board, move_type)

    # this is where logic goes to make a move

    3.times do |i|
      if (board[0][i] == move_type && board[1][i] == move_type)
        if(board[2][i] == '*')
          board[2][i] = move_type
          return board
        end
      end
      if (board[0][i] == move_type &&  board[2][i] == move_type)
        if(board[1][i] == '*')
          board[1][i] = move_type
          return board
        end
      end
      if (board[1][i] == move_type &&  board[2][i] == move_type)
        if(board[0][i] == '*')
          board[0][i] = move_type
          return board
        end
      end
    end

    3.times do |i|
      if (board[i][0] == move_type &&  board[i][1] == move_type)
        if(board[i][2] == '*')
          board[i][2] = move_type
          return board
        end
      end
      if (board[i][0] == move_type &&  board[i][2] == move_type)
        if(board[i][1] == '*')
          board[i][1] = move_type
          return board
        end
      end
      if (board[i][1] == move_type &&  board[i][2] == move_type)
        if(board[i][0] == '*')
          board[i][0] = move_type
          return board
        end
      end
    end

    if(board[0][0] == move_type &&  board[1][1] == move_type)
      if(board[2][2] == '*')
        board[2][2] = move_type
        return board
      end
    end
    if(board[0][0] == move_type &&  board[2][2] == move_type)
      if(board[1][1] == '*')
        board[1][1] = move_type
        return board
      end
    end
    if(board[1][1] == move_type &&  board[2][2] == move_type)
      if(board[0][0] == '*')
        board[0][0] = move_type
        return board
      end
    end
    if(board[0][2] == move_type &&  board[1][1] == move_type)
      if(board[2][0] == '*')
        board[2][0] = move_type
        return board
      end
    end
    if(board[0][2] == move_type &&  board[2][0] == move_type)
      if(board[1][1] == '*')
        board[1][1] = move_type
        return board
      end
    end
    if(board[1][1] == move_type &&  board[2][0] == move_type)
      if(board[0][2] == '*')
        board[0][2] = move_type
        return board
      end
    end

    #check for defense

    3.times do |i|
      if (board[0][i] != move_type &&  board[1][i] != move_type && board[0][i] != '*' &&  board[1][i] != '*')
        if(board[2][i] == '*')
          board[2][i] = move_type
          return board
        end
      end
      if (board[0][i] != move_type &&  board[2][i] != move_type && board[0][i] != '*' &&  board[2][i] != '*')
        if(board[1][i] == '*')
          board[1][i] = move_type
          return board
        end
      end
      if (board[1][i] != move_type &&  board[2][i] != move_type && board[1][i] != '*' &&  board[2][i] != '*')
        if(board[0][i] == '*')
          board[0][i] = move_type
          return board
        end
      end
    end

    3.times do |i|
      if (board[i][0] != move_type &&  board[i][1] != move_type && board[i][0] != '*' &&  board[i][1] != '*')
        if(board[i][2] == '*')
          board[i][2] = move_type
          return board
        end
      end
      if (board[i][0] != move_type &&  board[i][2] != move_type && board[i][0] != '*' &&  board[i][2] != '*')
        if(board[i][1] == '*')
          board[i][1] = move_type
          return board
        end
      end
      if (board[i][1] != move_type &&  board[i][2] != move_type && board[i][1] != '*' &&  board[i][2] != '*')
        if(board[i][0] == '*')
          board[i][0] = move_type
          return board
        end
      end
    end

    if(board[0][0] != move_type &&  board[1][1] != move_type && board[0][0] != '*' &&  board[1][1] != '*')
      if(board[2][2] == '*')
        board[2][2] = move_type
        return board
      end
    end
    if(board[0][0] != move_type &&  board[2][2] != move_type && board[0][0] != '*' &&  board[2][2] != '*')
      if(board[1][1] == '*')
        board[1][1] = move_type
        return board
      end
    end
    if(board[1][1] != move_type &&   board[2][2] != move_type && board[1][1] != '*' &&  board[2][2] != '*')
      if(board[0][0] == '*')
        board[0][0] = move_type
        return board
      end
    end
    if(board[0][2] != move_type &&  board[1][1] != move_type && board[0][2] != '*' &&  board[1][1] != '*')
      if(board[2][0] == '*')
        board[2][0] = move_type
        return board
      end
    end
    if(board[0][2] != move_type &&  board[2][0] != move_type && board[0][2] != '*' &&  board[2][0] != '*')
      if(board[1][1] == '*')
        board[1][1] = move_type
        return board
      end
    end
    if(board[1][1] != move_type &&  board[2][0] != move_type && board[1][1] != '*' &&  board[2][0] != '*')
      if(board[0][2] == '*')
        board[0][2] = move_type
        return board
      end
    end

     if board[1][1] == '*'
       board[1][1] = move_type
       return board
     end

     while(1)
       srand(Time.now.to_i)
       random1 = rand(3)
       random2 = rand(3)
       if board[random1][random2] == '*'
         board[random1][random2] = move_type
         return board
       end
     end




    return board
  end

  def check_victory(board)
    # check rows
    board.each do |x|
      if (x[0] == x[1] && x[1] == x[2] && x[0] != '*')
        return true
      end
    end
    # check columns
    3.times do |i|
      if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != '*')
        return true
      end
    end
    # check diagonals
    if(board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != '*')
      return true
    end
    if(board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != '*')
      return true
    end
    return false
  end

  def parse_tic_tac_toe_board(board)
    parsed = []
    board.each do |x|
      parsed.push(x.upcase.split('|'))
    end
    return parsed
  end

  def build_board_from_array(array)
    output = ""
    array.each do |x|
      output += x.join('|') + "\n"
    end
    return output
  end

end
