# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

classes = [
    {
        name: "Fighter",
        description: "A disciplined warrior trained in weaponry and warfare.",
        hp: "10",
        armor: "All armor and shields",
        weapons: "All melee and ranged weapons",
        defenses: "Fortitude, Reflex, Freedom, and Focus",
        skills: "Athletics, plus any four other skills",
        equipment: "-Two light melee weapons OR a medium melee weapon and a shield OR a heavy melee weapon \n -A short-range or long-range ranged weapon \n -A suit of light or heavy armor",
        spellcasting: "none",
        table_cols: {
            "Superiority Die": [
                "d6",
                "d6",
                "d6",
                "d8",
                "d8",
                "d8",
                "d10",
                "d10",
                "d10",
                "d12",
                "d12",
                "d12"
            ]
        }
    },
    {
        name: "Paladin",
        description: "A zealous warrior who has devoted themselves to a righteous cause.",
        hp: "10",
        armor: "Heavy armor and shields",
        weapons: "Medium and heavy melee weapons",
        defenses: "Fortitude, Focus, Will, and Perserverance",
        skills: "Command, plus any three other skills",
        equipment: "-A medium melee weapon and a shield OR a heavy melee weapon \n -A suit of heavy armor",
        spellcasting: "half",
        table_cols: {
            "Smite Damage": [
                "4",
                "4",
                "4",
                "5",
                "5",
                "5",
                "6",
                "6",
                "6",
                "8",
                "8",
                "8"
            ]
        }
    },
    {
        name: "Mage",
        description: "A student of the arcane arts wielding carefully sculpted magic.",
        hp: "6",
        armor: "None",
        weapons: "None",
        defenses: "Reflex, Focus, and Will",
        skills: "Arcana, plus any three other skills",
        equipment: "-A light or medium melee weapon \n -An arcane focus",
        spellcasting: "full"
    }
]

begin
    DndClass.destroy_all
    DndClass.create!(classes)
rescue => exception
    puts exception
end