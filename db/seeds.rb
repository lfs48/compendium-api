# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

DndClass.destroy_all

fighter = DndClass.create!({
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
})
    
paladin = DndClass.create!({
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
})


mage = DndClass.create!({
    name: "Mage",
    description: "A student of the arcane arts wielding carefully sculpted magic.",
    hp: "6",
    armor: "None",
    weapons: "None",
    defenses: "Reflex, Focus, and Will",
    skills: "Arcana, plus any three other skills",
    equipment: "- A light or medium melee weapon \n\n - An arcane focus",
    spellcasting: "full"
})

Race.destroy_all

human = Race.create!({
    name: "Human",
    description: "The most common and populous race, humans can be found almost everywhere and bear close resemblance to the humans of our own world. Though they have no inherent supernatural abilities, they possess limitless potential."
})

elf = Race.create!({
    name: "Elf",
    description: "Elves are a magical people of otherworldly grace, who have walked among the ancient places of the world since its dawn."
})

dwarf = Race.create!({
    name: "Dwarf",
    description: "Dwarves are a stout and hardy people who spring from the deep places on the world."
})

Feature.destroy_all

combat_superiority = Feature.create!({
    name: "Combat Superiority",
    description: "At key moments in battle, you can exert your tactical prowess to turn the tide in your favor. This ability is represented by a special pool of dice, called superiority dice. At 1st level, you have three superiority dice which are d6s. You can expend these dice to gain an upper hand over your foes in the following ways: \n\n - ***Feint.*** When you make an attack roll, you can add a superiority die to it as a bonus die. \n\n - ***Deflect.*** As a reaction when an attack roll is made against you, you can subtract a superiority die from it as a penalty die. \n\n Your superiority dice increase in number and size as you level up, as shown in the S. Dice and S. Die Size columns of the fighter table. \n\n You regain all expended superiority dice when you rest.",
    level: 1,
    kind: 'core'
})

extra_attack = Feature.create!({
    name: "Extra Attack",
    description: "When you take the Attack action on your turn, you can attack twice instead of once.",
    level: 4,
    kind: 'core'
})

action_surge = Feature.create!({
        name: "Action Surge",
        description: "During your turn, you can take one additional action. \n\n Once you use this feature, you can't do so again until you rest.",
        level: 7,
        kind: 'core'
})

divine_smite = Feature.create!({
        name: "Divine Smite",
        description: "When you successfully hit with a physical melee attack, you can deal 4 additional radiant damage. If the target is a fiend or undead, that damage is increased by 2. \n\n The damage dealt by this feature increases as you gain levels, as shown in the Smite column of the Paladin table. \n\n You can use this feature up to a number of times equal to your Charisma. You regain all expended uses when you rest.",
        level: 1,
        kind: 'core'
})
    
spellcasting_mage = Feature.create!({
        name: "Spellcasting (Mage)",
        description: "As a practitioner of the arcane arts, you have begun to learn how to bend reality to your will in the form of magic.",
        level: 1,
        kind: 'core'
})

armored_juggernaut = Feature.create!({
        name: "Armored Juggernaut",
        description: "While you are wearing heavy armor, any instance of damage you take from a physical attack is reduced by 3. Damage can't be reduced below 1 this way.",
        kind: 'major'
})
    
duelist_riposte = Feature.create!({
        name: "Duelist's Riposte",
        description: "When you use your *deflect* feature to change the outcome of an attack, you can immediately make a physical melee attack against the attacker as part of the same reaction.",
        kind: 'major'
})
    
champion_wilds = Feature.create!({
        name: "Champion of the Wilds",
        description: "When you deal Smite damage, you can cause spectral vines to spring up around the target. If the attack also successfully hits vs. Freedom, the target is restrained for 1 minute (Check at end of turn ends).",
        kind: 'major'
})
    
justicar_rebuke = Feature.create!({
        name: "Justicar's Rebuke",
        description: "When a foe hits you with a physical attack, you can deal 1 radiant damage to the attacker (no action required).",
        kind: 'major'
})
    
necromantic_harvest = Feature.create!({
        name: "Necromantic Harvest",
        description: "When you deal damage with a *necromancy* spell, you gain temporary HP equal to the damage it dealt to one of its targets. If at least one creature was killed by that damage, you are also healed for that amount. \n\n You can only benefit from this feature once per spell cast.",
        kind: 'major'
})
    
dramatic_appearance = Feature.create!({
        name: "Dramatic Appearance",
        description: "When you cast a spell that summons or teleports one or more entities, choose one of them. It arrives at its destination with an explosion.",
        kind: 'major'
})
    
bodyguard = Feature.create!({
        name: "Bodyguard",
        description: "You can use your Deflect feature in response to any physical attack against a target next to you, rather than only on attacks that target you.",
        kind: 'minor'
})
    
elemental_strikes = Feature.create!({
        name: "Elemental Strikes",
        description: "When you use your Feint feature, you can also change the type of damage dealt by the attack to burning, dousing, freezing, or shcoking.",
        kind: 'minor'
})
    
oath_vengeance = Feature.create!({
    name: "Oath of Vengeance",
    description: "When you take this boon, you swear vengeance against a specific creature (e.g. Orcus the Prince of Undeath) or organization (e.g. the Bloodskull Clan). \n\n When you use your Smite feature the chosen creature, a creature serving the chosen creature, or a creature belonging to or serving the chosen organization, the damage is increased by 2. \n\n When the chosen creature is slain or the chosen organization is destroyed or disbanded, your oath is fulfilled. The next time you engage in downtime you may swear a new oath naming a different creature or organization, or replace this boon with a different one.",
    kind: 'minor'
})
    
alter_memories = Feature.create!({
        name: "Alter Memories",
        description: "As a magic action, you can attempt to make a creature charmed by a spell you cast forget some of the time it spent charmed. Make a spell attack vs Will. On a successful hit, they lose their memories up until shortly before becoming charmed. \n\n Once you use this feature on a creature, you can't do so again on them while they're charmed by the same spell.",
        kind: 'minor'
})

malleable_illusions = Feature.create!({
        name: "Malleable Illusions",
        description: "As a bonus action, you can change the nature of an ongoing *illusion* spell you cast (using the spell's normal parameters), provided that you can see the illusion.",
        kind: 'minor'
})
    
arcane_initiate = Feature.create!({
    name: "Arcane Initiate",
    description: "Choose an *arcane* cantrip to learn. If you don't already have a spellcasting feature, use Intelligence as your spellcasting attribute. \n\n When you complete downtime, you can exchange this cantrip with another.",
    kind: 'minor'
})

human_versatility = Feature.create!({
    name: "Human Versatility",
    description: "You're proficient in one skill of your choice. When you complete downtime, you can swap this skill with a different one.",
    kind: 'core'
})

limitless_potential = Feature.create!({
    name: "Limitless Potential",
    description: "You gain one boon of your choice.",
    kind: 'core'
})

fae_magic = Feature.create!({
    name: "Fae Magic",
    description: "You can cast *illuminate* innately. When cast this way, you can only choose the *dancing lights* option. \n\n Additionally, you can cast *faerie fire* innately once per rest. \n\n If you don't already have a spellcasting feature, use Charisma as your spellcasting attribute.",
    kind: 'core'
})

trance = Feature.create!({
    name: "Trance",
    description: "Instead of sleeping, you enter a state of deep meditation called a *trance*. While tracing, you remain aware of your surroundings and can awaken at will. \n\n Effects that would forcibly put you to sleep have no effect on you.",
    kind: 'core'
})

starsight = Feature.create!({
    name: "Starsight",
    description: "You can see in natural starlight as if it were bright light.",
    kind: 'core'
})

iron_liver = Feature.create!({
    name: "Iron Liver",
    description: "You have resistance to toxic damage and advantage on any checks to prevent being poisoned or end poisoning on yourself.",
    kind: 'core'
})

mountain_roots = Feature.create!({
    name: "Mountain Roots",
    description: "Once per rest, if you would be knocked prone or forcibly moved, you can choose not to be.",
    kind: 'core'
})

tremorsense = Feature.create!({
    name: "Tremorsense",
    description: "You can perceive an area within your reach through vibrations along the ground, without requiring use of your other senses. Your feet must be on solid ground to benefit from this sense.",
    kind: 'core'
})

feature_sources = [
    {
        feature_id: combat_superiority.id,
        source_id: fighter.id,
        source_type: 'DndClass'
    },
    {
        feature_id: extra_attack.id,
        source_id: fighter.id,
        source_type: 'DndClass'
    },
    {
        feature_id: action_surge.id,
        source_id: fighter.id,
        source_type: 'DndClass'
    },
    {
        feature_id: armored_juggernaut.id,
        source_id: fighter.id,
        source_type: 'DndClass'
    },{
        feature_id: duelist_riposte.id,
        source_id: fighter.id,
        source_type: 'DndClass'
    },
    {
        feature_id: bodyguard.id,
        source_id: fighter.id,
        source_type: 'DndClass'
    },
    {
        feature_id: elemental_strikes.id,
        source_id: fighter.id,
        source_type: 'DndClass'
    },
    {
        feature_id: divine_smite.id,
        source_id: paladin.id,
        source_type: 'DndClass'
    },
    {
        feature_id: champion_wilds.id,
        source_id: paladin.id,
        source_type: 'DndClass'
    },
    {
        feature_id: justicar_rebuke.id,
        source_id: paladin.id,
        source_type: 'DndClass'
    },
    {
        feature_id: oath_vengeance.id,
        source_id: paladin.id,
        source_type: 'DndClass'
    },
    {
        feature_id: spellcasting_mage.id,
        source_id: mage.id,
        source_type: 'DndClass'
    },
    {
        feature_id: necromantic_harvest.id,
        source_id: mage.id,
        source_type: 'DndClass'
    },
    {
        feature_id: dramatic_appearance.id,
        source_id: mage.id,
        source_type: 'DndClass'
    },
    {
        feature_id: alter_memories.id,
        source_id: mage.id,
        source_type: 'DndClass'
    },
    {
        feature_id: malleable_illusions.id,
        source_id: mage.id,
        source_type: 'DndClass'
    },
    {
        feature_id: human_versatility.id,
        source_id: human.id,
        source_type: 'Race'
    },
    {
        feature_id: limitless_potential.id,
        source_id: human.id,
        source_type: 'Race'
    },
    {
        feature_id: fae_magic.id,
        source_id: elf.id,
        source_type: 'Race'
    },
    {
        feature_id: trance.id,
        source_id: elf.id,
        source_type: 'Race'
    },
    {
        feature_id: starsight.id,
        source_id: elf.id,
        source_type: 'Race'
    },
    {
        feature_id: iron_liver.id,
        source_id: dwarf.id,
        source_type: 'Race'
    },
    {
        feature_id: mountain_roots.id,
        source_id: dwarf.id,
        source_type: 'Race'
    },
    {
        feature_id: tremorsense.id,
        source_id: dwarf.id,
        source_type: 'Race'
    }
]

FeatureSource.destroy_all
FeatureSource.create!(feature_sources)

spells = [
    {
        name: "Spark",
        aspects: ["elemental","fire"],
        rank: '0',
        range: "Short",
        targets: "1 entity",
        casting_time: "1 action",
        duration: "Instantaneous",
        description: "A small flame sparks between your fingers. Make a spell attack vs Reflex. On a hit, the target takes 1/2/3 burning damage."
    },
    {
        name: "Zap",
        aspects: ["elemental","lightning"],
        rank: '0',
        range: "Short",
        targets: "1 entity",
        casting_time: "1 action",
        duration: "Instantaneous",
        description: "A jolt of electricity arcs between you and the target. Make a spell attack vs Fortitude. On a hit, the target takes 1/2/3 shocking damage."
    },
    {
        name: "Mage Hand",
        aspects: ["arcane","conjuration"],
        rank: '0',
        range: "Short",
        targets: "A point in space",
        casting_time: "1 action",
        duration: "1 minute",
        concentration: true,
        description: "You create a magical disembodied hand at the target location. The hand mimics any movements you perform with your own hand."
    },
    {
        name: "Minor Illusion",
        aspects: ["arcane","illusion"],
        rank: '0',
        range: "Short",
        targets: "N/A",
        casting_time: "1 action",
        duration: "1 minute",
        concentration: true,
        description: "You create an illusory image or sound within range. \n\n ***Image.*** The image is static and produces no sound, odor, or other sensation. \n\n ***Sound.*** The sound can range in volume from a whisper to a shout. The sound can either be instantaneous, or a repetitive sound that loops for the duration."
    },
    {
        name: "Fireball",
        aspects: ["elemental","fire"],
        rank: '1',
        range: "Long",
        targets: "Small area (Up to 2 entities)",
        casting_time: "1 action",
        duration: "Instantaneous",
        description: "You launch a ball of explosive flames at the target area. Make a spell attack vs Reflex. On a hit, deal 2/4/6 burning damage.",
        upcast: [
            "Increase the damage by 1 for each slot rank above 1st."
        ]
    },
    {
        name: "Magic Missile",
        aspects: ["arcane"],
        rank: '1',
        range: "Long",
        targets: "1 or more entities",
        casting_time: "1 action",
        duration: "Instantaneous",
        description: "You fire three missiles, each of which deals 1 ethereal damage to a target (no attack roll required). You can target the same entity with multiple missiles.",
        upcast: [
            "Fire two additional missiles for each slot rank above 1st."
        ]
    },
    {
        name: "Mend Wounds",
        aspects: ["holy"],
        rank: '1',
        range: "Touch",
        targets: "One willing creature",
        casting_time: "1 action",
        duration: "Instantaneous",
        description: "Healing energy radiates from your hands. The target receives 4 points of healing.",
        upcast: [
            "The healing is increased by 4 for each slot rank above 1st."
        ]
    },
    {
        name: "Wildtongue",
        aspects: ["nature"],
        rank: '1',
        range: "N/A",
        targets: "Self",
        casting_time: "1 action",
        duration: "10 minutes",
        concentration: true,
        description: "For the duration, you gain the ability to comprehend and verbally communicate with beasts. Beasts you interact with will understand you aren't a threat to them, unless they have specific reason to believe otherwise.",
        upcast: [
            "You also gain the ability to communicate with plants and fungi."
        ]
    },
    {
        name: "Flight",
        aspects: ["arcane", "augmentation"],
        rank: '2',
        range: "Touch",
        targets: "One willing creature",
        casting_time: "1 action",
        duration: "1 minute",
        description: "The target is able to fly for the duration.",
        upcast: [
            "You can target an additonal creature for each slot rank above 2nd. In addition, the  duration is increased to 10 minutes.",
            "The duration is increased to 1 hour."
        ]
    },
    {
        name: "Hypnotic Pattern",
        aspects: ["arcane", "enchantment"],
        rank: '2',
        range: "Short",
        targets: "Medium area (Up to four creatures)",
        casting_time: "1 action",
        duration: "1 minute",
        concentration: true,
        description: "A hypnotic pattern of colors mesmerizes creatures in the targeted area. Make a spell attack vs Focus. On a successful hit, a target is distracted for the duration (Focus check at end of turn and on taking damage ends). While distracted this way, they use their movement and action to chase and grab at the the lights."
    },
    {
        name: "Protection from Elements",
        aspects: ["arcane", "abjuration", "elemental"],
        rank: '2',
        range: "Touch",
        targets: "One willing creature",
        casting_time: "1 action",
        duration: "10 minutes",
        concentration: true,
        description: "Choose a damage type from: burning, dousing, freezing, or shocking. The target has resistance to that damage type for the duration.",
        upcast: [
            "The maximum number of targets is doubled for each slot rank above 2nd.",
            "The targets are immune to the chosen damage type."
        ]
    },
    {
        name: "Scrying",
        aspects: ["arcane","divination"],
        rank: '3',
        range: "Unlimited",
        targets: "One entity or location you name",
        casting_time: "10 minutes",
        duration: "10 minutes",
        concentration: true,
        material: "A mirror, pool of water, or other reflective surface at least 6'' across",
        description: "You project an image of the target on a reflective surface, allowing you to observe them for the duration. Through the projection, you can see and hear the target and their nearby surroundings. If the target moves, the projection follows them.",
        upcast: [
            "The duration becomes indefinite (i.e. for as long as you concentrate)."
        ]
    },
    {
        name: "Tree Stride",
        aspects: ["nature"],
        rank: '3',
        range: "N/A",
        targets: "Self",
        casting_time: "1 action",
        duration: "1 minute",
        concentration: true,
        description: "For the duration, you can enter a living tree and move from inside it to inside another tree within a long distance. Doing so expends one point of movement that round.",
        upcast: [
            "You can bring a willing creature you touch through with you."
        ]
    },
    {
        name: "Meteor",
        aspects: ["arcane"],
        rank: '4',
        range: "Sight",
        targets: "A zone",
        casting_time: "1 action",
        duration: "Instantaneous",
        material: "A meteorite fragment",
        description: "You sway the course of the stars, causing a meteor to hurtle towards the target location. The GM secretly rolls a d6; in that many rounds, the meteor will impact. Each entity in the zone when it lands takes 15 burning and 15 crushing damage. \n\n You must be under an open sky to cast this spell; otherwise it has no effect. The meteor itself is nonmagical and independant of the spell once its course is set."
    }
]

Spell.destroy_all
Spell.create!(spells)

items = [
    {
        name: "Rope Coil",
        description: "A 50 foot length of coiled hemp rope.",
        kind: "commodity",
        rarity: "common",
        bulk: "moderate",
        value: "5"
    },
    {
        name: "Lantern",
        description: "A fuel-burning lantern, which produces bright light out to a long distance when lit.",
        kind: "tool",
        rarity: "common",
        bulk: "bulky",
        value: "10"
    },
    {
        name: "Shortsword",
        description: "An edged light melee weapon.",
        kind: "weapon",
        rarity: "common",
        bulk: "moderate",
        value: "10"
    },
    {
        name: "Leather armor",
        description: "A suit of light armor consisting of a boiled leather vest, pants, greaves and vambraces.",
        kind: "armor",
        rarity: "common",
        bulk: "moderate",
        value: "15"
    },
    {
        name: "Potion of Healing, Minor",
        description: "A vial of viscuous candy-red liquid. When consumed, the drinker receives 5 points of healing.",
        kind: "consumable",
        rarity: "uncommon",
        bulk: "slight",
        value: "4d4×5"
    },
    {
        name: "Belt of Giant Strength",
        description: "A thick leather belt studded with iron beads. Its buckle is adorned with the face of a giant surrounded by runes. \n\n While wearing this belt, you get a d10 bonus die to all Strength checks.",
        kind: "gear",
        rarity: "rare",
        bulk: "moderate",
        value: "10d8×50"
    },
    {
        name: "Vorpal Sword",
        description: "A longsword of simple but elegant design, with an undecorated black hilt and a dark gray blade with crimson edges. \n\n This is a magical edged medium melee weapon of supreme quality (+5). When you score a critical hit with this weapon, roll a d20. If it lands on a d20, the target is automatically slain.",
        kind: "weapon",
        rarity: "legendary",
        bulk: "moderate",
        value: "Priceless"
    }
]

Item.destroy_all
Item.create!(items)