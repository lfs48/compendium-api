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
        equipment: "- Two light melee weapons OR a medium melee weapon and a shield OR a heavy melee weapon \n\n - A short-range or long-range ranged weapon \n\n - A suit of light or heavy armor",
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
        description: "A zealous champion who has devoted themselves to a righteous cause.",
        hp: "10",
        armor: "Heavy armor and shields",
        weapons: "Medium and heavy melee weapons",
        defenses: "Fortitude, Focus, Will, and Perserverance",
        skills: "Command, plus any three other skills",
        equipment: "- A medium melee weapon and a shield OR a heavy melee weapon \n\n - A suit of heavy armor",
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
        equipment: "- A light or medium melee weapon \n\n - An arcane focus",
        spellcasting: "full"
    }
]

begin
    DndClass.destroy_all
    DndClass.create!(classes)
rescue => exception
    puts exception
end


features = [
    {
        name: "Combat Superiority",
        description: "At key moments in battle, you can exert your tactical prowess to turn the tide in your favor. This ability is represented by a special pool of dice, called superiority dice. At 1st level, you have three superiority dice which are d6s. You can expend these dice to gain an upper hand over your foes in the following ways: \n\n - ***Feint.*** When you make an attack roll, you can add a superiority die to it as a bonus die. \n\n - ***Deflect.*** As a reaction when an attack roll is made against you, you can subtract a superiority die from it as a penalty die. \n\n Your superiority dice increase in number and size as you level up, as shown in the S. Dice and S. Die Size columns of the fighter table. \n\n You regain all expended superiority dice when you rest.",
        level: 1,
        kind: 'core'
    },
    {
        name: "Extra Attack",
        description: "When you take the Attack action on your turn, you can attack twice instead of once.",
        level: 5,
        kind: 'core'
    },
    {
        name: "Action Surge",
        description: "During your turn, you can take one additional action. \n\n Once you use this feature, you can't do so again until you rest.",
        level: 7,
        kind: 'core'
    },
    {
        name: "Divine Smite",
        description: "When you successfully hit with a physical melee attack, you can deal 4 additional radiant damage. If the target is a fiend or undead, that damage is increased by 2. \n\n The damage dealt by this feature increases as you gain levels, as shown in the Smite column of the Paladin table. \n\n You can use this feature up to a number of times equal to your Charisma. You regain all expended uses when you rest.",
        level: 1,
        kind: 'core'
    },
    {
        name: "Spellcasting (Mage)",
        description: "As a practitioner of the arcane arts, you have begun to learn how to bend reality to your will in the form of magic.",
        level: 1,
        kind: 'core'
    },
    {
        name: "2nd Rank Spells",
        description: "You are able to learn and cast 2nd rank spells.",
        level: 4,
        kind: 'core'
    },
    {
        name: "3rd Rank Spells",
        description: "You are able to learn and cast 3rd rank spells.",
        level: 7,
        kind: 'core'
    },
    {
        name: "4th Rank Spells",
        description: "You are able to learn and cast 4th rank spells.",
        level: 10,
        kind: 'core'
    },
    {
        name: "Armored Juggernaut",
        description: "While you are wearing heavy armor, any instance of damage you take from a physical attack is reduced by 3. Damage can't be reduced below 1 this way.",
        kind: 'major'
    },
    {
        name: "Duelist's Riposte",
        description: "When you use your *deflect* feature to change the outcome of an attack, you can immediately make a physical melee attack against the attacker as part of the same reaction.",
        kind: 'major'
    },
    {
        name: "Champion of the Wilds",
        description: "When you deal Smite damage, you can cause spectral vines to spring up around the target. If the attack also successfully hits vs. Freedom, the target is restrained for 1 minute (Check at end of turn ends).",
        kind: 'major'
    },
    {
        name: "Justicar's Rebuke",
        description: "When a foe hits you with a physical attack, you can deal 1 radiant damage to the attacker (no action required).",
        kind: 'major'
    },
    {
        name: "Necromantic Harvest",
        description: "When you deal damage with a *necromancy* spell, you gain temporary HP equal to the damage it dealt to one of its targets. If at least one creature was killed by that damage, you are also healed for that amount. \n\n You can only benefit from this feature once per spell cast.",
        kind: 'major'
    },
    {
        name: "Dramatic Appearance",
        description: "When you cast a spell that summons or teleports one or more entities, choose one of them. It arrives at its destination with an explosion.",
        kind: 'major'
    },
    {
        name: "Bodyguard",
        description: "You can use your Deflect feature in response to any physical attack against a target next to you, rather than only on attacks that target you.",
        kind: 'minor'
    },
    {
        name: "Elemental Strikes",
        description: "When you use your Feint feature, you can also change the type of damage dealt by the attack to burning, dousing, freezing, or shcoking.",
        kind: 'minor'
    },
    {
        name: "Oath of Vengeance",
        description: "When you take this boon, you swear vengeance against a specific creature (e.g. Orcus the Prince of Undeath) or organization (e.g. the Bloodskull Clan). \n\n When you use your Smite feature the chosen creature, a creature serving the chosen creature, or a creature belonging to or serving the chosen organization, the damage is increased by 2. \n\n When the chosen creature is slain or the chosen organization is destroyed or disbanded, your oath is fulfilled. The next time you engage in downtime you may swear a new oath naming a different creature or organization, or replace this boon with a different one.",
        kind: 'minor'
    },
    {
        name: "Alter Memories",
        description: "As a magic action, you can attempt to make a creature charmed by a spell you cast forget some of the time it spent charmed. Make a spell attack vs Will. On a successful hit, they lose their memories up until shortly before becoming charmed. \n\n Once you use this feature on a creature, you can't do so again on them while they're charmed by the same spell.",
        kind: 'minor'
    },
    {
        name: "Malleable Illusions",
        description: "As a bonus action, you can change the nature of an ongoing *illusion* spell you cast (using the spell's normal parameters), provided that you can see the illusion.",
        kind: 'minor'
    },
    {
        name: "Arcane Initiate",
        description: "Choose an *arcane* cantrip to learn. If you don't already have a spellcasting feature, use Intelligence as your spellcasting attribute. \n\n When you complete downtime, you can exchange this cantrip with another.",
        kind: 'minor'
    }
]

begin
    Feature.destroy_all
    Feature.create!(features)
rescue => exception
    puts exception
end