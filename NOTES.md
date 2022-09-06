**Open rails console / dbconsole**
    rails c - open console
    rails dbconsole - open DBconsole - .help, .quit, .tables, .fullschema
**============================**

**Generating Model/view/controller**
    rails g(generate) scaffold NameOfModel(singular) attribute1:string attribute2:integer attribute3:boolean attribute4:attribute_type attribute_name:references(to generate a reference attribute to a Table as a foreign_key)

    rails db:migrate - override changes

**============================**

**class 70 - "Corrigindo o CRUD"**
    **Erasing last changes on DB-Migration**
        rails db:rollback
    **Destroying a generated scaffold - for DB-Model Changes**
        rails d scaffold ScaffoldName

**============================**

**class 71 - "Criando uma "standalone" migration"**
    **Generating empty migration to add an attribute to a Table**
        rails g migration AddXxxZToYyyC
        ex: rails g migration AddPartNumberToProducts
    **Generating empty migration to remove an attribute from a Table**
        rails g migration RemoveXxxZFromYyyC
        ex: rails g migration RemovePartNumberFromProducts
    **Generating migration adding an attribute to a Table with the desired attribute you want to add in command**
        rails g migration AddXxxZToYyyC attribute_name:attribute_type
        ex: rails g migration AddPartNumberToProducts part_number:string
    **Generating migration removing an attribute from a Table with the desired attribute you want to remove in command**
        rails g migration RemoveXxxZFromYyyC attribute_name:attribute_type
        ex: rails g migration RemovePartNumberFromProducts part_number:string
    **Finally, migrate your changes:**
        rails db:migrate

**============================**

**class 72 - "Associação "belongs_to" - creating associations between tables - Foreign-Key - references attribute - belongs_to attribute for models**
    **Generating a scaffold with references_attributes to a Table - Resolving table side**
        rails g(generate) scaffold ExampleOfModelName(singular) attribute1_ex:string attribute2_ex:integer attribute3_fk_ex:references(generate a reference attribute to a Table as a foreign_key)
    **Resolving model side**
        inside "models/model_that_has_foreing_key(association(s))", add belongs_to :mining_type(for example), within the class model:
            <!-- class Coin < ApplicationRecord
                belongs_to :mining_type
            end --> example

**============================**

**class 73 - "Associação 'has_many'" - inversely proportional to belongs_to:** 
    **The model class in which has a belongs_to association, its counterpart will have a 'has_many' association**
        <!-- example: 
            class Coin < ApplicationRecord
                belongs_to :mining_type
            end  
            its counterpart:
            class MiningType < ApplicationRecord
                has_many :coins(model name in plural, to express the database table and the semantic)
            end
         -->

**============================**

**class 75 - "COnhecendo os métodos .map e o .pluck" - the .pluck method is an abreviattion of the .map method** 
    <!-- example: 
        ** THE .MAP() METHOD CAN BE USED ALSO AS .COLLECT() **
        c = Coin.all
        c.map {|coin| [coin.description, coin.acronym]} - the attributes came from map, can be outputted inside, or outside an array, its opitional
        c.map([&:description]) - its also posible to output an attribute with the &:attribute, but only works with 1 attibute, otherwise, an error will be raised
        **Its possible to use .pluck method to shorten the code - used like that below:**
        c.pluck(:description) - it outputs an array of all the attributes description of all the Coin's objects(instances)
        **It is also possible to call the method, producing more than 1 attribute, different from the shorthanded .map(&:attribute) method - used like that below:** 
        c.pluck(:description, :acronym) - it output an array of arrays of all the attributes of the Coin's table instances, called by the method -
            output =>>  [["Bitcoin", "BTC"], ["Ethereum", "ETH"], ...]  

        
    -->

**============================**