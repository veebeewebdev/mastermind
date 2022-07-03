class Mastermind
  def initialize
    @computer_pick = []
    @colors = %w[red orange yellow green blue violet]
  end

  def who_picks
    @code_picker = ''
    until @code_picker[0] == 'y' || @code_picker[0] == 'n'
      puts "Do you want to choose the code? y/n\n"
      @code_picker = gets.chomp.split(' ')

      if @code_picker[0] == 'y'
        # print "okay, pick four"
        print "\nYour secret code is #{player_picks}. Don't worry, I won't tell.\n" #NOW THIS SHOULD GO ON TO HAVE THE COMPUTER GUESS
      elsif @code_picker[0] == 'n'
        computer_picks
      else
        print 'Hmm, try again.'
      end
    end
  end

  def computer_picks
    4.times do
      @choice = @colors.sample(1)
      @computer_pick.push(@choice[0])
    end
    print "Computer picks: #{@computer_pick} (only shown for testing)\n"
  end

  def player_picks
    @player_pick = []
    # MAKE IT SO YOU HAVE TO PICK FOUR!!!

    until @player_pick.length == 4
      puts "\nChoose four separated by spaces: red, orange, yellow, green, blue, violet; duplicates are okay!\n"
      @player_pick = gets.chomp.split(' ')

    #   print "\nYou picked #{@player_pick}\n"

      print "\nYou have to pick exactly four!\n" if @player_pick.length != 4
    end
    return @player_pick
  end

  def computer_guess

  end

  def winner
    if @match_found == 4
      #   print 'All four matched!'
      true
    end
  end

  def check_solution
    unless winner == true
      @unmatched_player_guesses = []
      @unmatched_computer_picks = []
      @combined_array = []
      @index_to_delete = []

      @match_found = 0
      @imperfect_match_found = 0

      @combined_array = @player_pick.zip(@computer_pick)
      @combined_array.map.with_index do |x, index|
        if x[0] == x[1]
          @index_to_delete.push(index)
          @match_found += 1

        end
        #   print "winner != true yet"
      end

      print "\nPerfect matches found: #{@match_found}\n"
      if winner == true
        print "\nAll four matched!\n"
        nil
      else

        @index_to_delete.reverse.each do |each|
          @combined_array.delete_at(each)
        end

        # print "\n#{@combined_array}" # [player choice, computer choice]

        @combined_array.each do |each|
          @unmatched_player_guesses.push(each[0])
          @unmatched_computer_picks.push(each[1])
        end
        @unmatched_player_guesses.each do |each|
          next unless @unmatched_computer_picks.include?(each)

          @match_index = @unmatched_computer_picks.index(each)
          @unmatched_computer_picks.delete_at(@match_index)
          @imperfect_match_found += 1
        end

        print "\nColors correct with wrong location: #{@imperfect_match_found}\n"
      end
    end
  end

  def play
    rounds = 0
    who_picks
    until winner || rounds == 12
        print "\nYou picked #{player_picks}\n"
        check_solution
      rounds += 1
    end
  end
end

game = Mastermind.new
game.play
