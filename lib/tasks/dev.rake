# ╔╦╗╔═╗╦╔╗╔  ╔╦╗╔═╗╔═╗╦╔═            
# ║║║╠═╣║║║║   ║ ╠═╣╚═╗╠╩╗            
# ╩ ╩╩ ╩╩╝╚╝   ╩ ╩ ╩╚═╝╩ ╩  
namespace :dev do
  desc "Configure development environment and seed DB"
  # Comando para gerar a task - "rails g(generate) task namespace nome_da_task"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping DB...") { %x(rails db:drop) }
      show_spinner("Creating DB...") { %x(rails db:create) }
      show_spinner("Migrating DB...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "You are not in a development environment"
    end
  end


  # ╔═╗╔═╗╦╔╗╔╔═╗                       
  # ║  ║ ║║║║║╚═╗                       
  # ╚═╝╚═╝╩╝╚╝╚═╝  
  desc "Register coins"
  task add_coins: :environment do
    coins = [
      {    
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://media.istockphoto.com/vectors/bitcoin-vector-art-graphic-isolated-on-white-background-vector-id1283399040?k=20&m=1283399040&s=612x612&w=0&h=en5oHEXP8xg8GMb13WeVNXAQqg51SrSEbLZirwsoEXA=",
        mining_type: MiningType.find_by(acronym: 'PoW') #.where(acronym: 'PoW') returns an array with qty of elements finded in table, while .find_by(acronym: 'PoW'), returns only 1 element, the 1st founded. 
      },
      {
        description: "Dash",
        acronym: "DASH",
        url_image: "https://ih1.redbubble.net/image.406055498.8711/ap,550x550,12x12,1,transparent,t.png",
        mining_type: MiningType.find_by(acronym: 'PoS')
      },
      {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://st3.depositphotos.com/1076504/15705/i/450/depositphotos_157059264-stock-photo-ethereum-encryption-concept.jpg",
        mining_type: MiningType.find_by(acronym: 'PoC')
      }, 
      {
        description: "Iota",
        acronym: "IOT",
        url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
        mining_type: MiningType.find_by(acronym: 'PoW')
      }, 
      {
        description: "ZCash",
        acronym: "ZEC",
        url_image: "https://www.cryptocompare.com/media/351360/zec.png",
        mining_type: MiningType.find_by(acronym: 'PoS')
      }, 
    ]
    show_spinner("Registering coins...") do
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end


  # ╔╦╗╦╔╗╔╦╔╗╔╔═╗  ╔╦╗╦ ╦╔═╗╔═╗        
  # ║║║║║║║║║║║║ ╦   ║ ╚╦╝╠═╝║╣         
  # ╩ ╩╩╝╚╝╩╝╚╝╚═╝   ╩  ╩ ╩  ╚═╝
  desc "Register mining_types"
  task add_mining_types: :environment do
    mining_types = [
      {
        description: "Proof of Work",
        acronym: "PoW"
      },
      {
        description: "Proof of Stake",
        acronym: "PoS"
      },
      {
        description: "Proof of Capacity",
        acronym: "PoC"
      }
    ]
    show_spinner("Registering mining types...") do
      mining_types.each do |type|
        MiningType.find_or_create_by!(type)
      end
    end
  end


  # ╔╦╗╔═╗╔╦╗╦ ╦╔═╗╔╦╗╔═╗               
  # ║║║║╣  ║ ╠═╣║ ║ ║║╚═╗               
  # ╩ ╩╚═╝ ╩ ╩ ╩╚═╝═╩╝╚═╝
  private #apenas o namespace dev:setup terá acesso ao método
  def show_spinner(start_msg, end_msg="Done")
      spinner = TTY::Spinner.new("[:spinner] #{start_msg}...", format: :bouncing_ball)
      spinner.auto_spin
      yield #O bloco de código yield deve ser inserido dentro de um do snippet, ou até entre chaves '{}', quando é apenas uma linha de execução
      spinner.success("(#{end_msg})")
  end

end
