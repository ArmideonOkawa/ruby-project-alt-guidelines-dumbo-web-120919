

class BountyApp 

        attr_reader :user, :bounty
    def run
        welcome
        sign_in
        #menu
        bounty_list
    end

    private 
    def prompt_font
        TTY::Font.new(:doom)
    end
    def welcome
        font = prompt_font
       
        font.write("BOUNTY HUNT")
        puts "Welcome to Bounty Hunt"
    end
    def prompt_instance
        TTY::Prompt.new
    end

    def sign_in

        puts "Please enter your name to sign in"
        answer = gets.chomp

        @user = User.find_or_create_by(name: answer)
        sleep(1.2)
        puts "Welcome #{@user.name.capitalize}"

    end
    def menu
        prompt = prompt_instance
        choices = {'Bounties' => 1, 
                   'Current Bounties' => 2, 
                   'Turn in' => 3,
                   'Current Bankroll: $0.00' => 4}
        prompt.select("Select an option #{@user.name.capitalize}?", choices)

        if choices == 'Bounties'
            puts "List of bounties"
        else
            puts "Thank you"
        end
        
        #avalable bounties
        #current bounties(empty, ask if they want to pick bounties)
        #current bankroll
        #turn in
        #exit
    end
    def bounty_list
        @list = Bounty.where("value < 2500").order(value: :desc)
        #display bounty list
        #select and add to inventory
        #remove from bounty list
        #add to inventory
        #return to menu
    end
    def bounty_owned
        #if empty prompt user to pick bounties & send to bounty list
        #dispplay selected bounties
    end
    def bankroll
        #display total sum of completed bounties
    end
    def turn_in
        #prompts user to complete list of owned bounties
        #if complete, value is added to user bankroll
        #destroys bounty
    end

end