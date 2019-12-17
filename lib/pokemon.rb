class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db: "./db/pokemon.rb")
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(a, b, c)

    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?,?)
    SQL
    @db = c
    @db.execute(sql, a, b)
    @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    # new_pokemon = self.new(id: id, name: name, type: type)
  end

end
