def check_solution
    @unmatched_player_guesses = []
    @unmatched_computer_picks = []
    @combined_array = []
    @index_to_delete = []

    @match_found = 0
    @imperfect_match_found = 0

    @combined_array = @player_solution.zip(@computer_pick)
    @combined_array.map.with_index do |x, index|
      if x[0] == x[1]
        @index_to_delete.push(index)
        @match_found += 1
      end
    end

    print "Perfect matches found: #{@match_found}\n"

    @index_to_delete.reverse.each do |each|
      @combined_array.delete_at(each)
    end

    print @combined_array # [player choice, computer choice]

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
    print "\nColors correct with wrong location: #{@imperfect_match_found}"
  # end
end
  
  
  

  



  