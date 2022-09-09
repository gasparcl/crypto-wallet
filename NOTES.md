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

**class 75 - "Conhecendo os métodos .map e o .pluck" - the .pluck method is an abreviattion of the .map method** 
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

**class 79 - "Ativando o I18n" - Application Internationalization** 
    <!-- 1) Add to Gemfile gem '"rails-i18n", "~> 5.1"' - if your rails version is 5.x.x or above  -->
    <!-- 2) exec. bundle(bundle install) -->
    <!-- 3) create a folder on root/config/initializers/locale.rb and paste the defaul config: 
        # Permitted locales available for the application
        I18n.available_locales = [:en, "pt-BR"]
        # Set default locale to something other than :en
        I18n.default_locale = :en
        note: In case that you want to use a different folder from default to get your tranlation files, paste the code below:
            # I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')] - desired directory(path) 
    -->

**============================**

**class 80 - "Usando o I18n" - Application Internationalization - p2** 
    <!-- 1) There are 2 most commom methods in I18n library - I18n.t()(translate) and I18n.l()(localize) - set some data into local format 
    - On a view page, you can use the methods without library prefix/class(I18n) - it would be like that - t("translation-key") and l()
    -->

**============================**

**class 87 - "Pré-compilando e isolando assets por controller" - Improve application performance** 
    <!-- Inside config/initializers/assets.rb, include the command for precompiling your js and css assets:
        for example:
            Rails.application.config.assets.precompile += %w( cable.js welcome.js coins.js mining_types.js )
            Rails.application.config.assets.precompile += %w( welcome.css scaffolds.css coins.css mining_types.css )
      -->

**============================**