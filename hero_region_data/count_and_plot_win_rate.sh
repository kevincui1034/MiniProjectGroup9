#!/bin/bash

heroes=("antimage" "axe" "bane" "bloodseeker" "crystal_maiden" "drow_ranger" "earthshaker" "juggernaut" "mirana" "nevermore" "morphling" "phantom_lancer" "puck" "pudge" "razor" "sand_king" "storm_spirit" "sven" "tiny" "vengefulspirit" "windrunner" "zuus" "kunkka" "lina" "lich" "lion" "shadow_shaman" "slardar" "tidehunter" "witch_doctor" "riki" "enigma" "tinker" "sniper" "necrolyte" "warlock" "beastmaster" "queenofpain" "venomancer" "faceless_void" "skeleton_king" "death_prophet" "phantom_assassin" "pugna" "templar_assassin" "viper" "luna" "dragon_knight" "dazzle" "rattletrap" "leshrac" "furion" "life_stealer" "dark_seer" "clinkz" "omniknight" "enchantress" "huskar" "night_stalker" "broodmother" "bounty_hunter" "weaver" "jakiro" "batrider" "chen" "spectre" "doom_bringer" "ancient_apparition" "ursa" "spirit_breaker" "gyrocopter" "alchemist" "invoker" "silencer" "obsidian_destroyer" "lycan" "brewmaster" "shadow_demon" "lone_druid" "chaos_knight" "meepo" "treant" "ogre_magi" "undying" "rubick" "disruptor" "nyx_assassin" "naga_siren" "keeper_of_the_light" "wisp" "visage" "slark" "medusa" "troll_warlord" "centaur" "magnataur" "shredder" "bristleback" "tusk" "skywrath_mage" "abaddon" "elder_titan" "legion_commander" "ember_spirit" "earth_spirit" "abyssal_underlord" "terrorblade" "phoenix" "techies" "oracle" "winter_wyvern" "arc_warden")
echo "Extracting win rate per hero, sorting, and plotting them..."
INFILE=$(< dota2Test.csv)
OUTPUT_FILE="hero_win_rate.txt"


var=4
> "$OUTPUT_FILE"

# Loop through the CSV columns corresponding to heroes
for i in {5..117}; do
    # Calculate hero index by adjusting with 'var'
    heroNum=$((i - var))
    # Use awk to process the column and count the occurrences
    losses=$(awk -v i="$i" -F ',' '{if ($i == -1) {print 1}}' * | sort | uniq -c | \
    awk '{print "\t", $1}')
    wins=$(awk -v i="$i" -F ',' '{if ($i == 1) {print 1}}' * | sort | uniq -c | \
    awk '{print "\t", $1}')
    total=$((wins + losses))
    if [ "$total" -ne 0 ]; then
        winrate=$((100 * wins / total)) 
    else
        winrate=0 
    fi
    
    echo "${heroes[heroNum]}, $winrate%" >> "$OUTPUT_FILE"
done
sort -k2,2nr "$OUTPUT_FILE" -o "$OUTPUT_FILE"
gnuplot plotwinrate.gp
echo "Win rate has been outputted in hero_win_rate.txt and plotted in heroes_win_rate_plot.png successfully."

