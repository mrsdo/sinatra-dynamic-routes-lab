# frozen_string_literal: true

require_relative 'config/environment'

# Class App Router
class App < Sinatra::Base
  # Write your code here!
  # Reverse Name.
  get '/reversename/:name' do
    @name = params[:name].reverse
    "Hello, this is your name in reverse: #{@name}!"
  end

  # Square number = x^2 (written as x**2 in Ruby).
  get '/square/:number' do
    @number = params[:number].to_i * params[:number].to_i
    "Hello, this is your square number: #{@number}!"
  end

  # Accepts 'n' number of words and returns the number + phrase.
  # Next time Try :number.times {:phrase}
  get '/say/:number/:phrase' do
    # @print = params[:phrase].split(/ /, 1) * params[:number].to_i
    # @string = params

    #   print params[:phrase]
    # end
    # @number.times do
    #   @phrase = params[:phrase]
    # end
    @print = params[:phrase].split('_') * params[:number].to_i
    "Hello, this is your number: #{params[:number]}
     ...and this is your phrase(s):
     #{@print} "
  end
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end
  get '/:operation/:number1/:number2' do
    number1 = params[:number1].to_i
    number2 = params[:number2].to_i

    @answer = 'Unable to perform this operation'

    case params[:operation]
    when 'add'
      @answer = (number1 + number2).to_s
    when 'subtract'
      @answer = (number1 - number2).to_s
    when 'multiply'
      @answer = (number1 * number2).to_s
    else params[:operation] == 'divide'
         @answer = (number1 / number2).to_s
    end
  end
end
