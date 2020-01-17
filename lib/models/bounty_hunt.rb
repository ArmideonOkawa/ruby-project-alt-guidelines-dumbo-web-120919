require 'pry'
require 'tty-prompt'
require 'colorize'
require 'colorized_string'

class BountyHunt

    attr_reader :user
    attr_accessor :prompt
  
    def initialize
      @prompt = TTY::Prompt.new
    end

    def run
        greet
        sign_in
        menu
    end

    private 

    #****************************************************
    #*******************MAIN METHODS*********************
    #****************************************************
    def greet
        title
        system "echo Welcome to Bounty Track!!! | lolcat -a -d 10 "
        sleep(2.0)
        screen_wipe
        title
        puts "Now loading...."
        sleep(2)
        screen_wipe
    end
    def title
        font = TTY::Font.new
        pastel = Pastel.new

        puts pastel.yellow(font.write("Bounty Track"))
        
    end

    def sign_in

        puts "Please enter your name to sign in".colorize(:red)
        answer = gets.chomp

        @user = User.find_or_create_by(name: answer)
        sleep(1.2)
        puts "Welcome #{@user.name.capitalize}!"
        screen_wipe

    end
    
    #*********************************************
    #******************Interface******************
    #*********************************************
    def menu

        items = %w[Bounties Turn-in Bankroll Exit]
        menu_select = prompt.select('Please choose from one of the following options:', items)

        screen_wipe
            sleep(1)
            if menu_select == 'Bounties'
                print_bounty_list
                sleep(2)

            elsif menu_select == 'Turn-in'
                screen_wipe
                sleep(1)
                turn_in

            elsif menu_select = 'Bankroll'
                sum
                puts "Code is working properly"

            else  menu_select = 'Exit'
                puts "Thank you, and be sure to come hunting again"
                sleep(0.3)

                title
                puts "Copyright @mmxx"
                sleep(3)
            end
        sleep(2)
            screen_wipe
        sleep(1)
            title
        puts "Loading..."
        sleep(2)
        screen_wipe
    end

    def bounty_menu
        print_bounty_list
        sleep(0.5)

        user_input = prompt.ask?('Would you like to turn your bounties in?')
        if user_input == 'y'
            turn_in
        elsif user_input == 'n'
            menu
        else 
            puts "Invalid information, please try again"
            return user_input 
        end
    end

    def turn_in
        puts "Calculating...."
        sleep(0.3)
        screen_wipe
        puts "Calculating...."
        sleep(0.3)
        screen_wipe
        sleep(0.3)
        bounty_list

        sum 
        sleep(2)
    end
    #********************************************************
    #********************HELPER METHODS**********************
    #********************************************************
    def screen_wipe
        system 'clear'
    end

    def bounty_list

        list = Bounty.all.select do |bounty|
           bounty.user_id == @user.id
        end
        #list = Bounty.where(user_id: user.id)
    end

    def print_bounty_list
        system 'echo Here are your available bounties:' 
        @bounties = bounty_list.each_with_index do |bounty, i|
          puts " #{i + 1}. Offense: #{bounty.offense} ------ Payout:$#{bounty.value} ------ Status: #{bounty.completed}".colorize(:blue)
          puts "----------------------------------------------"
          sleep(0.2)
        end
        user_answer = prompt.yes?('Would you like to turn n your bounties?')
        if user_answer == 'y'
            turn_in
            binding.pry
        else user_answer == 'n'
            screen_wipe
            menu
        end
    end

    def select_bounty
        bounty_options = %w[Bounty.where("user_id == user.id")]
        bounty_select = prompt.select('Please chose a bounty to complete', bounty_options)
    end

    def sum
       sum = Bounty.sum(:value)
       puts "Your total funds equal $#{sum}."
       sleep(0.8)
       screen_wipe
       sleep(0.5)
       menu
       #destroy_all
    end

end


#####NEEDED TO DO
##Give user an empty array to start
##Change bounty list to unowned list
##Create a user or log in user with empty bounty array
##Create bounty request
##Remove Bounty from master list and move it to user list
##